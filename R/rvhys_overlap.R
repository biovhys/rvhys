# 查看overlap
check_overlap <- function(vector1, vector2) {
  c(
    x_only = length(dplyr::setdiff(vector1, vector2)),
    overlap = length(dplyr::intersect(vector1, vector2)),
    y_only = length(dplyr::setdiff(vector2, vector1))
  )
}
