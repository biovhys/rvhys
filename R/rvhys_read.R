#' Title
#'
#' @return
#' @export
#'
#' @examples
rvhys_read <- function(file){
  data.table::fread(file) |>
    tibble::as_tibble()
}
