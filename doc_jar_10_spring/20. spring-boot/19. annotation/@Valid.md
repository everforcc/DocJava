<span  style="font-family: Simsun,serif; font-size: 17px; ">

### controller

- @Validated

### method

- @Valid

### GlobalExceptionHandler

~~~java
    @ExceptionHandler(ConstraintViolationException.class)
public AjaxResult handleConstraintViolationException(ConstraintViolationException e,HttpServletRequest request)
        {
        String requestURI=request.getRequestURI();
        log.error("请求地址'{}',发生未知异常.",requestURI,e);
        return AjaxResult.error(e.getConstraintViolations().stream()
        .map(ConstraintViolation::getMessage)
        .findFirst()
        .orElse(null));
        }
~~~

</span>