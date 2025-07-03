# Windows 下批量将GBK编码文件安全转换为UTF-8操作流程

## 问题说明
直接用 PowerShell 脚本批量转码会导致原本是UTF-8的文件乱码。正确做法是：**只转换GBK文件，跳过UTF-8文件**。

---

## 方法一：PowerShell 脚本（仅跳过带BOM的UTF-8文件）

1. 在项目根目录下，按住Shift右键，选择"在此处打开PowerShell窗口"。
2. 执行以下脚本：

```powershell
Get-ChildItem -Recurse -Include *.java,*.txt,*.md,*.sql | ForEach-Object {
    $bytes = [System.IO.File]::ReadAllBytes($_.FullName)
    # 检查UTF-8 BOM头
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        Write-Host "跳过UTF-8带BOM文件：$($_.FullName)"
    } else {
        try {
            $content = Get-Content $_.FullName -Encoding Default
            Set-Content $_.FullName -Value $content -Encoding UTF8
            Write-Host "已转换：$($_.FullName)"
        } catch {
            Write-Host "跳过文件：$($_.FullName)（无权限或被占用）"
        }
    }
}
```

> 注意：此方法只能跳过带BOM的UTF-8文件，不能100%识别无BOM的UTF-8文件。

---

## 方法二：Python 脚本（推荐，自动识别编码，保留换行格式）

1. 安装依赖（需安装Python和chardet库）：
   ```bash
   pip install chardet
   ```
2. 在项目根目录下新建 `convert_gbk_to_utf8.py`，写入以下内容：

   ```python
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
           if name.endswith(('.java', '.txt', '.md', '.sql')):
               convert_file(os.path.join(root, name))
   ```

   - 关键点：`open(filepath, 'w', encoding='utf-8', newline='')` 保证换行符不被自动转换，最大程度保留原文件格式。

3. 在命令行运行：
   ```bash
   python convert_gbk_to_utf8.py
   ```

---

## 方法三：Notepad++ 批量检测和转换
1. 用 Notepad++ 打开文件夹，批量查找"编码"列为"ANSI"的文件（通常是GBK）。
2. 选中这些文件，批量转换为UTF-8。

---

## 总结
- 推荐用Python脚本自动识别编码，最安全。
- PowerShell方法只能跳过带BOM的UTF-8，不能100%避免误转码。
- 转换前请务必备份文件。
- Python脚本建议用上面修正版，保证转码后文件格式不乱。
