# 除去字符串向量每个元素中所有空格 -----
rvhys_compress <- function(x) {
  dplyr::str_replace_all(x, " ", "")
}
