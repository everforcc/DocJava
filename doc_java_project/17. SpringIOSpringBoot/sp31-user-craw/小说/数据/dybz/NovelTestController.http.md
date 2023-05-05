<font face="Simsun" size=3>

~~~

### msg
### menu
### content
### 1. 获取小说基本信息
POST http://localhost:31/test/msg
Content-Type: application/json

{
  "url": "http://www.1diyibanzhu.xyz/2/2527/",
  "config":
  {
    "novelMsgTileXR": "//div[@class='right']//h1//text()",
    "novelMsgDescriptionXR": "//div[@class='mod book-intro']//div[@class='bd']//text()",
    "novelMsgAuthXR": "//div[@class='right']//p[@class='info']//text()"
  }
}

### 2. 获取全部目录
###
POST http://localhost:31/test/menu
Content-Type: application/json

{
  "url": "http://www.1diyibanzhu.xyz/2/2527/",
  "config":
  {
    "novelMsgTileXR": "//div[@class='right']//h1//text()",
    "novelMsgDescriptionXR": "//div[@class='mod book-intro']//div[@class='bd']//text()",
    "novelMsgAuthXR": "//div[@class='right']//p[@class='info']//text()",
    "novelCapterMenuXR": "//a[@class='indexPage']//@href",
    "novelCapterUrlListXR": "//div[@class='container']//div[7]//a//@href",
    "novelCapterPageNextUrlXR": "//a[@class='nextPage']//@href",
    "novelCapterNameXR": "//h1[@class='page-title']/text()",
    "novelContentUrlPageXR": "//center[@class='chapterPages']//a//text()",
    "novelContentXRFlowList": [
      "//div[@id='ad']",
      "//div[@class='neirong']"
    ]
  }
}

### 3. 内容
POST http://localhost:31/test/content
Content-Type: application/json

{
  "url": "",
  "config":
  {
    "novelCapterNameXR": "",
    "novelContentUrlPageXR": "",
    "novelContentXRFlowList": [
      "",
      ""
    ]
  }
}

### https://www.wenku8.net/book/2632.htm
### https://www.wenku8.net/book/1973.htm
### //div[@id='content']//tr[@align='center']//td//table//tbody//tr//td//span//b//@text()
### //div[@id='content']//tr[@align='center']//tr//td[1]//b//text()


~~~

</font>