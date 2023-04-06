#' 判断向量x是否存在异常值
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
rvhys_check <- function(x) {
  c(
    n_NA = is.na(x) |> sum(),
    n_NAN = is.nan(x) |> sum(),
    n_Inf = is.infinite(x) |> sum(),
    n_NULL = is.null(x) |> sum(),
    n_blank = stringr::str_detect(x, "\\s+") |> sum()
  )
}
