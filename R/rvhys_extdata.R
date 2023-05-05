#' @title Get extdata path
#'
#' @param path
#'
#' @return
#' @export
#'
#' @examples
rvhys_extdata <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "rvhys"))
  } else {
    system.file("extdata", path, package = "rvhys", mustWork = TRUE)
  }
}
