<span style="font-family:Simsun,serif; font-size:17px;">

[TOC]

#### I/O 多路复用 内部如何操作

- 进程可以通过 select、poll、epoll 发起
- I/O 多路复用的系统调用，这些系统调用都是同步阻塞的：
    - 如果传入的多个文件描述符中，有描述符就绪，则返回就绪的描述符；
    - 否则如果所有文件描述符都未就绪，就阻塞调用进程，直到某个描述符就绪，或者阻塞时长超过设置的 timeout 后，再返回。
    - I/O多路复用内部使用非阻塞 I/O 检查每个描述符的就绪状态。
- timeout
    - 如果 timeout参数设为 NULL，会无限阻塞直到某个描述符就绪；
    - 如果timeout参数设为 0，会立即返回，不阻塞。

</span>