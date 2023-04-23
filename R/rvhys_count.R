#' Title
#'
#' @param df
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#'
rvhys_count <- function(df, ...){
  dt <- as.data.table(df)
  dt[, .(n = .N), by = ...] %>%
    tibble::as_tibble()
}
