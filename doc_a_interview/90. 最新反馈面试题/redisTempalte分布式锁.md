<span style="font-family:Simsun,serif; font-size:17px;">

### 分布式锁

基于spring data redis中提供的`redisTempalte`，实现分布式锁的功能，要求满足：

1. 能在持有锁的线程终止后，自动释放锁。
2. 能强行抢占锁，被强的线程能暂停执行，并等待锁的恢复。
3. 实现公平锁，即锁的持有是有序的。（扩展题，可不作答）

### code

- 不会

</span>