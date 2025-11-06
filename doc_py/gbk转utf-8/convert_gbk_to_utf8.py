import chardet
import os

def convert_file(filepath):
    with open(filepath, 'rb') as f:
        raw = f.read()
    result = chardet.detect(raw)
    encoding = result['encoding']
    if encoding and encoding.lower() in ['gbk', 'gb2312', 'gb18030']:
        try:
            text = raw.decode(encoding)
            # 保持Windows换行符格式
            with open(filepath, 'w', encoding='utf-8', newline='') as f:
                f.write(text)
            print(f"已转换: {filepath}")
        except Exception as e:
            print(f"跳过: {filepath}，原因: {e}")

for root, dirs, files in os.walk('.'):
    for name in files:
        if name.endswith(('.java', '.txt', '.md', '.sql', '.json')):
            convert_file(os.path.join(root, name))