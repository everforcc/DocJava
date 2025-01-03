
~~~
    @PostMapping(value = "/cameraImport", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public AjaxResult cameraImport(@RequestParam Map<String,Long> map,@RequestPart("file")  MultipartFile file) {
        return znMachineCameraService.cameraImport(map,file);
    }
~~~
