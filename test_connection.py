import os
from dotenv import load_dotenv

# Ép nạp lại biến môi trường từ tệp .env
load_dotenv(override=True)

gemini_key = os.getenv("GEMINI_API_KEY", "").strip()
neo4j_uri = os.getenv("NEO4J_URI", "").strip()
neo4j_user = os.getenv("NEO4J_USER", "").strip()
neo4j_password = os.getenv("NEO4J_PASSWORD", "").strip()
neo4j_db = os.getenv("NEO4J_DATABASE", "").strip()

print("=" * 60)
print("🔍 KIỂM TRA HỆ THỐNG TOÀN DIỆN TRÊN LAPTOP")
print("=" * 60)

# ---------------------------------------------------------
# 1. TEST GOOGLE GEMINI API (TỰ ĐỘNG DÒ MODEL KHẢ DỤNG)
# ---------------------------------------------------------
print("\n1️⃣  Kiểm tra Google Gemini API Key...")

if not gemini_key:
    print("❌ LỖI: Chưa tìm thấy GEMINI_API_KEY trong tệp .env!")
else:
    try:
        from google import genai
        client = genai.Client(api_key=gemini_key)
        
        # Dò tìm mô hình Flash hỗ trợ generateContent
        available_models = [m.name for m in client.models.list() if hasattr(m, 'supported_actions') and 'generateContent' in m.supported_actions]
        
        target_model = None
        for m_name in available_models:
            if 'flash' in m_name.lower():
                target_model = m_name
                break
        if not target_model and available_models:
            target_model = available_models
            
        if target_model:
            clean_name = target_model.replace('models/', '')
            response = client.models.generate_content(
                model=clean_name,
                contents='Trả lời ngắn đúng 3 từ: Kết nối tốt.'
            )
            print(f"✅ Kết nối Gemini API THÀNH CÔNG! (Model: {clean_name})")
            print(f"   💬 AI phản hồi: \"{response.text.strip()}\"")
        else:
            print("❌ LỖI: Không tìm thấy mô hình Flash nào khả dụng trên API Key.")
    except Exception as e:
        print(f"❌ LỖI kết nối Gemini API: {e}")

# ---------------------------------------------------------
# 2. TEST NEO4J AURA DATABASE
# ---------------------------------------------------------
print("\n2️⃣  Kiểm tra kết nối Cơ sở dữ liệu Neo4j Aura...")
try:
    from neo4j import GraphDatabase
    driver = GraphDatabase.driver(neo4j_uri, auth=(neo4j_user, neo4j_password))
    
    with driver.session(database=neo4j_db) as session:
        result = session.run("RETURN '🎉 KẾT NỐI NEO4J AURA THÀNH CÔNG RỰC RỠ!' AS status")
        record = result.single()
        print(f"✅ {record['status']}")
        
        count_result = session.run("MATCH (n) RETURN count(n) AS total_nodes")
        total = count_result.single()["total_nodes"]
        print(f"   📊 Tổng số Nodes hiện có trong CSDL: {total}")
        
    driver.close()
except Exception as e:
    print(f"❌ LỖI kết nối Neo4j: {e}")

print("\n" + "=" * 60)
print("🎉 HOÀN TẤT KIỂM TRA")
print("=" * 60)