from docling.document_converter import DocumentConverter

converter = DocumentConverter()

result = converter.convert(
    r"D:\Vietnamese tax\luat48.pdf"
)

markdown = result.document.export_to_markdown()

with open(
    r"D:\Vietnamese tax\luat48.md",
    "w",
    encoding="utf-8"
) as f:
    f.write(markdown)

print("Done!")