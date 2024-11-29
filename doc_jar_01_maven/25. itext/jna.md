<span  style="font-family: Simsun,serif; font-size: 17px; ">

### pdf转换

- [itextpdf](https://itextpdf.com/en/resources/downloads)
- [itext-github](https://github.com/itext/itext7)

### pom

~~~xml
<properties>
  <itext.version>REPLACE_WITH_DESIRED_ITEXT_VERSION</itext.version>
</properties>
<dependencies>
  <dependency>
    <groupId>com.itextpdf</groupId>
    <artifactId>itext-core</artifactId>
    <version>${itext.version}</version>
    <type>pom</type>
  </dependency>
  <dependency>
    <groupId>com.itextpdf</groupId>
    <artifactId>bouncy-castle-adapter</artifactId>
    <version>${itext.version}</version>
  </dependency>
</dependencies>
~~~

</span>