<span  style="font-family: Simsun,serif; font-size: 17px; ">

- [菜鸟教程-JavaScript find() 方法](https://www.runoob.com/jsref/jsref-find.html)
~~~
var ages = [3, 10, 18, 20];
 
function checkAdult(age) {
    return age >= 18;
}
 
function myFunction() {
    document.getElementById("demo").innerHTML = ages.find(checkAdult);
}
~~~

- 例子

~~~js
node.value.find((v)=>{
if(v.id === id){
  path.unshift(v.name);
  console.log("level path: ", path);
  findNodePath(node, path, v.parentId);
}
});
~~~

</span>