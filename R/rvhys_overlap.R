#' 查看overlap
#'
#' @param vector1
#' @param vector2
#'
#' @return
#' @export
#'
#' @examples
rvhys_overlap <- function(vector1, vector2) {
  c(
    x_only = length(dplyr::setdiff(vector1, vector2)),
    overlap = length(dplyr::intersect(vector1, vector2)),
    y_only = length(dplyr::setdiff(vector2, vector1))
  )
}
