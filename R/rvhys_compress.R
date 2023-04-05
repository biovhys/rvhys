#' 除去字符串向量每个元素中所有空格
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
rvhys_compress <- function(x) {
  dplyr::str_replace_all(x, " ", "")
}
