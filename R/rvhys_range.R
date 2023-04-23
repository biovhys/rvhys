#' @title compute range
#' @description
#' 计算极差
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_range(1:5)
#'
rvhys_range <- function(...){
  rg <- range(...)
  rg[[2]] - rg[[1]]
}
