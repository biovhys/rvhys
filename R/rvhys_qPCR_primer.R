#' @title Pick qPCR primer
#'
#' @source <https://biodb.swu.edu.cn/qprimerdb/>
#'
#' @param gene
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_qPCR_primer("At4g31770")
#'
rvhys_qPCR_primer <- function(gene) {
  load(rvhys_extdata("rvhys_qPrimerDB.rda"))
  purrr::map(
    1:2,
    ~ rvhys_qPrimerDB$data[[.x]] %>%
      dplyr::filter(stringr::str_detect(GeneID, stringr::str_to_upper(gene))) %>%
      dplyr::select(-c(primerID, FpID, RpID))
  ) %>%
    purrr::set_names(c("Best", "All"))
}
