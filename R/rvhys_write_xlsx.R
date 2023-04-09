#' @title export formatted excel
#' @description
#' 导出适合学术发表的excel表格风格，后续还需要手动调整列宽，单元格对其方式，如有
#' 必要，也可以修改窗口冻结设置
#'
#' @return
#' @export
#'
#' @examples
#' \donttest{
#' rvhys_write_xlsx(iris, "test.xlsx")
#' }
#'
rvhys_write_xlsx <- function(df, file) {
  hs <- openxlsx::createStyle(
    fgFill = "grey80", halign = "center", valign = "center",
    textDecoration = "bold", textRotation = 0
  )
  wb <- openxlsx::write.xlsx(df, file, headerStyle = hs,
                             firstRow = TRUE, firstCol = TRUE)
  openxlsx::modifyBaseFont(wb, fontSize = 11, fontColour = "black", fontName = "Arial")
  openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
}
