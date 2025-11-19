<span  style="font-family: Simsun,serif; font-size: 17px; ">

## Excel 星号字体颜色修复记录

### 背景

- EasyExcel 在写两级表头时会把所有标题写成普通字符串 `<v><t>...</t></v>`。
- 我们后续用 POI 尝试把 `*` 改成红色字体，但只调用 `cell.setCellValue(richText)`，在保存工作簿时 EasyExcel
  最初写入的字符串又覆盖了富文本，导致最终 `sheet1.xml` 仍然是黑色。
- 备注行同样因为被当作普通字符串处理，无法单独设置星号颜色。

### 根因

1. EasyExcel 生成的 header cell 类型是 `sharedString/inlineStr`，如果不直接操作底层 `CTCell`，再次 `setCellValue(String)`
   会清除富文本。
2. 备注行在 `SheetWriteHandler` 中只写入纯文本，没有任何富文本信息。

### 解决方案

1. **表头（必填字段）**
    - 在 `DynamicExportService#applyRedStar` 中使用 `XSSFRichTextString#append` 分段构建文本；
    - 直接拿到底层 `CTCell`，设置 `ctCell.setT(STCellType.INLINE_STR)`、`ctCell.setIs(richText.getCTRst())` 并 `unsetV()`
      ，确保 `sheet1.xml` 写出 `<rPr><color rgb="FFFF0000"/></rPr>`。
2. **备注行**
    - 在 `ExcelStyleHandler#processRemarkRow` 中新增 `applyRemarkRichText`，将所有星号替换为红色富文本，仍保持其他字符黑色；
    - 同样通过 `CTCell` 写入 inlineStr，使 Excel 能正确显示。
3. **注释与日志**
    - 在关键方法旁补充说明：为何必须使用 inlineStr、为何需要标准化星号等，方便后续维护。

### 验证

- 生成 `DynamicTestColor` 的示例文件，解压 `sheet1.xml` 可看到 header 和 remark 均包含
  `<rPr><color rgb="FFFF0000"/></rPr>`。
- 在 Excel/WPS 中打开文件，必填列与备注里的 `*` 均显示为红色，问题解决。

### 通过 XML 判断是否生效

1. 将生成的 `.xlsx` 改名为 `.zip` 并解压，定位到 `xl/worksheets/sheet1.xml`。
2. 搜索目标单元格（如 `C2`, `D2`, 备注 `A1`）的 `<c>` 节点：
    - 如果仍是 `<is><t>*管理员</t></is>` 这样的纯文本，说明颜色没有生效；
    - 正确情况下应出现 `<is><r><rPr><color rgb="FFFF0000"/>...</rPr><t>*</t></r>`，即 `<r>` 中带 `<rPr>`。
3. 若想进一步确认所用字体，可同时检查 `xl/styles.xml` 内的 `<fonts>`，对应 fontId 应包含 `color rgb="FFFF0000"`。

</span>