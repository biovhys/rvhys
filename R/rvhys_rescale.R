#' @title 0-1 rescale
#' @description
#' 0-1 rescale
#'
#' @param x
#' @param type
#'
#' @return
#' @export
#'
#' @examples
rvhys_rescale <- function(x, type = 1){
  # type=1 正向指标, type=2 负向指标
  rng = range(x, na.rm = TRUE)
  if (type == 1) {
    (x - rng[1]) / (rng[2] - rng[1])
  } else {
      (rng[2] - x) / (rng[2] - rng[1])
  }
}
