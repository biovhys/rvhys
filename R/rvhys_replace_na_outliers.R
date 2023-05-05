#' @title Replace outliers with NA
#' 
#' @param data 
#'
#' @param var 
#'
#' @examples
#' tibble::tibble(a = c(1, 30, 33, 37), b = c(15, 16, 18, 100)) %>% 
#' rvhys_replace_na_outliers(a) %>% 
#' rvhys_replace_na_outliers(b)
#' 
rvhys_replace_na_outliers <- function(data, var) {
  mutate(data, "{{var}}" := dplyr::if_else({{var}} > quantile({{var}}, probs = c(0.25, 0.75))[1] - 1.5 * IQR({{var}}) &
                                             {{var}} < quantile({{var}}, probs = c(0.25, 0.75))[2] + 1.5 * IQR({{var}}), 
                                           {{var}}, NA))
}