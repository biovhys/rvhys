#' 计算向量内任意两个数值的差值
#'
#' @param vector
#'
#' @return
#' @export
#'
#' @examples
#'
rvhys_diff <- function(vector) {
  vector |>
    tidyr::expand_grid(., .) |>
    purrr::set_names(c("one", "two")) |>
    dplyr::mutate(dis = abs(two - one)) |>
    dplyr::distinct(dis) |>
    dplyr::pull(dis)
}
