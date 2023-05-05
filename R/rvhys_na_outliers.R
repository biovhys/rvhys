#' @title Replace outliers with NA
#' 
#' @importFrom rlang :=
#' 
#' @param data 
#' @param var 
#' @examples
#' x <- tibble::tibble(a = c(1, 30, 33, 37), b = c(15, 16, 18, 100))
#' rvhys_na_outliers(x, a)
#' rvhys_na_outliers(x, b)
#' 
rvhys_na_outliers <- function(data, var) {
  dplyr::mutate(data, "{{var}}" := dplyr::if_else({{var}} > stats::quantile({{var}}, probs = c(0.25, 0.75))[1] - 1.5 * stats::IQR({{var}}) &
                                                    {{var}} < stats::quantile({{var}}, probs = c(0.25, 0.75))[2] + 1.5 * stats::IQR({{var}}), 
                                                  {{var}}, NA))
}