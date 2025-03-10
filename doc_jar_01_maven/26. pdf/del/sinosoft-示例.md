<span  style="font-family: Simsun,serif; font-size: 17px; ">

- PDF转jpg

### pdf转图片

~~~java
PDDocument doc=PDDocument.load(new File("")));
        PDFRenderer reader=new PDFRenderer(doc);
//1.将pdf转为图片
        BufferedImage bfi=reader.renderImageWithDPI(i,120);
//2. 文件路径
        File file2=ocrRecognitionService.getPicPath(picName);
        ImageIO.write(bfi,picName.split("\\.")[1],file2);
~~~

### PDF 转 图片

~~~java
/**
 *
 * @Title: pdfFileToPic
 * @Description: 将pdf文件转换为图片并保存到固定的路径下
 * @param: @param picName
 * @param: @param invoiceFile
 * @param: @return
 * @param: @throws Exception      
 * @return: List<EcdInvoiceOcrDto>
 * @throws
 */
public List<EcdInvoiceOcrDto> pdfFileToPic(String picName,File invoiceFile
        ,String invoiceTypeCode)throws Exception{
        List<EcdInvoiceOcrDto> picPathList=new ArrayList<EcdInvoiceOcrDto>();
        PDDocument doc=PDDocument.load(invoiceFile);
        PDFRenderer reader=new PDFRenderer(doc);
        int pageNo=doc.getNumberOfPages();
        for(int i=0;i<pageNo; i++){
//1.将pdf转为图片
        BufferedImage bfi=reader.renderImageWithDPI(i,120);
//2.获取图片存储路劲
        File file2=ocrRecognitionService.getPicPath(picName);
        ImageIO.write(bfi,picName.split("\\.")[1],file2);
        /*
         * 3.新建发票实体类并设置发票的存放路劲
         * 若发票为专票或是普票则将发票图片变成二进制数组 传回 待发票识别时使用
         */
        EcdInvoiceOcrDto ecdInvoiceOcrDto=new EcdInvoiceOcrDto();
        ByteArrayOutputStream bos=null;
        FileInputStream fis=null;
        try{
        if(invoiceTypeCode.equals(IConstants.INVOICE_TYPE_SPECIAL)
        ||invoiceTypeCode.equals(IConstants.INVOICE_TYPE_PLAIN)){
        bos=new ByteArrayOutputStream();
        fis=new FileInputStream(file2);
        byte[]data=new byte[2048];
        int len=0;
        while((len=fis.read(data))!=-1){
        bos.write(data,0,len);
        }
        bos.flush();
        ecdInvoiceOcrDto.setImageStreamStr(new BASE64Encoder().encode(bos.toByteArray()));
        }
        }catch(Exception e){
        logger.error("读取图片成二进制数组失败",e);
        throw new Exception();
        }finally{
        if(bos!=null){
        bos.close();
        }
        if(fis!=null){
        fis.close();
        }
        }

        ecdInvoiceOcrDto.setPicPath(file2.getAbsolutePath());
        ecdInvoiceOcrDto.setImageName(file2.getName());
        picPathList.add(ecdInvoiceOcrDto);
        }
        return picPathList;
        }
~~~

### 图片格式转换

~~~java
ImageIO.write(ImageNew, "png", outFile);// 写图片
中间的参数支持：
png,
jpg,
gif
(暂只支持这几种，其他的不支持)
~~~

</span>