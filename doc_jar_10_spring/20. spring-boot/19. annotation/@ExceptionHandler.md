<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @RestControllerAdvice

- ��������404���ȷ��ʵ����⣬�ӹ�spring�Զ���

### @ExceptionHandler(Exception.class)

- ��������ȫ�ֵ��쳣
- ��Ҫ��Ϸ���ע��
- yml��������

~~~yml
# �Զ���404
# ���ִ���ʱ, ֱ���׳��쳣
spring.mvc.throw-exception-if-no-handler-found=true
  # ��ҪΪ���ǹ����е���Դ�ļ�����ӳ��
spring.resources.add-mappings=false
~~~

</span>