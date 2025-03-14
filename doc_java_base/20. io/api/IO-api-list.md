<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

### 常用方法

- [x] str到文件
- [x] 文件到str
- [x] 对象到文件
- [x] 文件到对象
- [x] 二进制到文件
- [x] 文件到二进制
- [x] str到流
- [x] boj到流

### 缓冲区

- 4096
- ![](https://gitee.com/MyYukino/media/raw/master/PicGo/202204261523152.png)

### java输入/输出流 体系中常用的流

| 分类            | 字节输入流                    | 字节输出流                     | 字符输入流               | 字符输出流               |
|---------------|--------------------------|---------------------------|---------------------|---------------------|
| 抽象基类          | InputStream              | OutputStream              | Reader              | Writer              |
| 访问文件          | **FileInputStream**      | **FileOutputStream**      | **FileReader**      | **FileWriter**      |
| 访问数组          | **ByteArrayInputStream** | **ByteArrayOutputStream** | **CharArrayReader** | **CharArrayWriter** |
| 访问管道(不懂)      | **PipedInputStream**     | **PipedOutputStream**     | **PipedReader**     | **PipedWriter**     |
| 访问字符串         |                          |                           | **StringReader**    | **StringWriter**    |
| 缓冲流           | BufferedInputStream      | BufferedOutputStream      | BufferedReader      | BufferedWriter      |
| 转换流           |                          |                           | InputSteamReader    | OutputStreamWriter  |
| 对象流(序列化)      | ObjectInputStream        | ObjectOutputStream        |                     |                     |
| 抽象基类          | *FilterInputStream*      | *FilterOutputStream*      | *FilterReader*      | *FilterWriter*      |
| 打印流           |                          | PrintStream               |                     | PrintWriter         |
| 推回输入流         | PushbackInputStream      |                           | PushbackReader      |                     |
| 特殊流(基本数据类型操作) | DataInputStream          | DataOutputStream          |                     |                     |

- 注：粗体字标出的类代表节点流，必须直接与指定的物理节点关联;   
- 斜体字标出的类代表抽象基类，无法直接创建实例
- 网络传输使用 GZipInputStream

### 说明

- 字节流 *Stream; 读取单个字节
- 字符流 *Reader  *Writer; 每次读取一个字符，字符占用字节根据编码不同而改变。UTF-8
- 字节流 用来处理二进制文件，图片，音频，视频等。
- 字符流用来处理文本，人们可以看懂的字符

### 常用的

- 文件 File*
- 缓冲 Buffer*
- 序列化 Object*

### 归类

```mermaid
graph LR
IO-->字节流
字节流-->InputStream
字节流-->OutputStream

InputStream-->ByteArrayInputStream
InputStream-->PipedInputStream
InputStream-->FilterInputStream
InputStream-->FileInputStream
InputStream-->ObjectInputStream

FilterInputStream-->BufferedInputStream
FilterInputStream-->DataInputStream

OutputStream-->ByteArrayOutputStream
OutputStream-->PipedOutputStream
OutputStream-->FilterOutputStream
OutputStream-->FileOutputStream
OutputStream-->ObjectOutputStream

FilterOutputStream-->BufferedOutputStream
FilterOutputStream-->DataOutputStream
FilterOutputStream-->PrintStreamStream

IO-->字符流
字符流-->Reader

Reader-->CharArrayReader
Reader-->PipedReader
Reader-->FilterReader
Reader-->BufferReader
Reader-->InputStreamReader

InputStreamReader-->FileReader

字符流-->Writer

Writer-->CharArrayWriter
Writer-->PipedWriter
Writer-->FilterWriter
Writer-->BufferWriter
Writer-->InputStreamWriter

InputStreamWriter-->FileWriter

```

</span>