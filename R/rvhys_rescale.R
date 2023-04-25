#' @title 归一化
#' @description
#' min-max normalization
#'
#' @param x
#' @param type
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_rescale(c(1:5,7:22, Inf), min = 1, max = 2)
#'
rvhys_rescale <- function(x, type = "pos", min = 0, max = 1){
  rng = range(x, na.rm = TRUE, finite = TRUE)
  switch(type,
         "pos" = (max - min) * (x - rng[1]) / (rng[2] - rng[1]) + min,
         "neg" = (max - min) * (rng[2] - x) / (rng[2] - rng[1]) + min)
}
