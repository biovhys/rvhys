# 把字符串向量 x 的元素去除首尾的空白
rvhys_strip <- function(x) {
  x <- dplyr::str_replace_all(x, "^[[:space:]]+", "")
  x <- dplyr::str_replace_all(x, "[[:space:]]+$", "")
  x
}
