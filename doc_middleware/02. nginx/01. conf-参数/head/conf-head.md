<span  style="font-family: Simsun,serif; font-size: 17px; ">

### head

- ��nginx ������������ʱ��������ݴ浽����Ȼ��ִ���ͻ��˴��䡣
- ���ǣ�

1. �����ļ���Ȩ�ޣ���ȡ�ļ�û��Ȩ�ޣ�����
2. ������������nginx������󻺴棬����

~~~nginx
user root   //�˴�����˼��nginx ʹ��root ��Ȩ�ޣ��������1
head{
    proxy_buffers 16 512k;     //�˴�ֵ����nginx ���� 16�� 512k �Ŀ���л��棬�ܹ���СΪ16*512k   �������2
    proxy_buffer_size 512k;    //����ֵ����ÿ���С �������2
}
~~~

- ����Ŀ¼
~~~
/var/cache/nginx/proxy_temp
~~~

</span>