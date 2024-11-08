<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 数据读取

~~~sql
select JSON_EXTRACT(info, '$.key') as name from dual;
select info -> '$.key' as name from dual;
~~~

### 数据修改

~~~
JSON_SET(json_doc, path, val)：在JSON文档中添加或更新一个键值对。如果指定的键不存在，则添加该键及其对应的值；如果键已存在，则更新其值。
JSON_REPLACE(json_doc, path, val)：替换JSON文档中的现有值。如果指定的键不存在，则不进行任何操作。
JSON_INSERT(json_doc, path, val)：向JSON文档中插入数据，但如果路径已存在，则不进行任何操作。
JSON_REMOVE(json_doc, path)：从JSON文档中删除指定路径下的数据。
~~~

</span>