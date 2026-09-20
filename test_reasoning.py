import os
from dotenv import load_dotenv
from neo4j import GraphDatabase
from google import genai

# 1. Nạp biến môi trường từ .env
load_dotenv(override=True)

gemini_key = os.getenv("GEMINI_API_KEY", "").strip()
neo4j_uri = os.getenv("NEO4J_URI", "").strip()
neo4j_user = os.getenv("NEO4J_USER") or os.getenv("NEO4J_USERNAME", "c23a768d").strip()
neo4j_password = os.getenv("NEO4J_PASSWORD", "").strip()
neo4j_db = os.getenv("NEO4J_DATABASE", "c23a768d").strip()

print("=" * 70)
print("🧪 CHẠY THỬ NGHIỆM LỚP SUY LUẬN (GRAPH-RAG REASONING TEST)")
print("=" * 70)

# 2. Câu hỏi kiểm thử tình huống thực tế
TEST_QUERY = "Doanh nghiệp phát sinh chi phí lãi vay có giao dịch liên kết trong năm tính thuế 2024 - 2025 thì điều kiện khống chế chi phí lãi vay được trừ và quy tắc chuyển chi phí lãi vay không được trừ sang kỳ sau được quy định như thế nào?"
USER_MODE = "STUDENT"  # Chọn 'STUDENT' (Luyện thi CPA) hoặc 'CONSULTANT' (Tư vấn Dịch vụ)

print(f"📌 Câu hỏi kiểm thử: \"{TEST_QUERY}\"")
print(f"📌 Chế độ trải nghiệm: {USER_MODE}\n")

# 3. Truy vấn Subgraph dữ liệu liên quan từ Neo4j Aura
print("🔍 1. Đang truy vấn Subgraph tri thức từ Neo4j Aura Cloud...")

context_passages = []
try:
    driver = GraphDatabase.driver(neo4j_uri, auth=(neo4j_user, neo4j_password))
    with driver.session(database=neo4j_db) as session:
        # Truy vấn tìm các Node & Relationship liên quan đến Giao dịch liên kết / Lãi vay / Luật Thuế
        cypher_query = """
        MATCH (n)
        WHERE n.Title CONTAINS 'lãi vay' OR n.Title CONTAINS 'giao dịch liên kết' 
           OR n.Name CONTAINS 'lãi vay' OR n.Content CONTAINS 'lãi vay'
        OPTIONAL MATCH (n)-[r]->(m)
        RETURN n, r, m LIMIT 25
        """
        result = session.run(cypher_query)
        for record in result:
            node_n = record["n"]
            rel = record["r"]
            node_m = record["m"]
            
            n_info = dict(node_n) if node_n else {}
            m_info = dict(node_m) if node_m else {}
            rel_type = rel.type if rel else "RELATED"
            
            context_passages.append(f"Node: {n_info} -[{rel_type}]-> Node: {m_info}")
            
    driver.close()
    print(f"✅ Đã trích xuất thành công {len(context_passages)} liên kết tri thức từ Graph Database.")
except Exception as e:
    print(f"⚠️ Cảnh báo Neo4j: {e} (Sử dụng fallback context)")

graph_context_text = "\n".join(context_passages) if context_passages else "Dữ liệu Subgraph về khống chế chi phí lãi vay 30% EBITD, Nghị định 132/2020/NĐ-CP và Nghị định 20/2025/NĐ-CP, thời gian chuyển tiếp không quá 5 năm liên tục."

# 4. Đóng gói Grounded System Prompt
grounded_prompt = f"""
# SYSTEM PROMPT: GROUNDED REASONING ENGINE (CPA VIETNAM SYSTEM)
Bạn là AI Trợ lý Tri thức Thuế. Nhiệm vụ của bạn là giải đáp câu hỏi dựa TRỰC TIẾP và DUY NHẤT trên Ngữ cảnh Tri thức được truy vấn từ Neo4j.

### NGUYÊN TẮC KHÓA CỨNG:
1. Tuyệt đối KHÔNG tự suy diễn ngoài Context.
2. Trích dẫn chính xác Điều, Khoản, Văn bản pháp luật.
3. Xuất ra Chuỗi bằng chứng (EvidenceChain) rõ ràng.

### CHẾ ĐỘ NGƯỜI DÙNG: {USER_MODE}

<GRAPH_CONTEXT>
{graph_context_text}
</GRAPH_CONTEXT>

<USER_QUESTION>
{TEST_QUERY}
</USER_QUESTION>
"""

# 5. Gọi Gemini API suy luận với Temperature = 0.0 (Triệt tiêu bịa đặt)
print("\n🤖 2. Đang gửi sang Gemini API để xử lý suy luận (Deterministic Mode)...")
try:
    client = genai.Client(api_key=gemini_key)
    
    # Dò model Flash khả dụng
    available_models = [m.name for m in client.models.list() if hasattr(m, 'supported_actions') and 'generateContent' in m.supported_actions]
    target_model = "gemini-1.5-flash"
    for m in available_models:
        if 'flash' in m.lower():
            target_model = m.replace('models/', '')
            break

    response = client.models.generate_content(
        model=target_model,
        contents=grounded_prompt,
        config={
            'temperature': 0.0, # Ép AI bám 100% vào Context
            'top_p': 0.1
        }
    )
    
    print("\n" + "=" * 70)
    print("🎯 KẾT QUẢ PHẢN HỒI TỪ LỚP SUY LUẬN (EVIDENCE CHAIN & REASONING)")
    print("=" * 70)
    print(response.text)
    print("=" * 70)

except Exception as e:
    print(f"❌ LỖI gọi Gemini API: {e}")