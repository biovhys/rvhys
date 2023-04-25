#' @title pipe-friendly permutation test
#'
#' @param data 
#' @param formula 
#' @param reps 
#'
#' @return
#' @export
#'
#' @examples
#' tibble::tibble(a = runif(5, 1, 2), b = runif(5, 4, 5)) %>% 
#'     pivot_longer(cols = everything(), names_to = "group", values_to = "value") %>% 
#'     rvhys_perm2(value ~ group)

rvhys_perm2 <- function(data, formula, reps = 10000) {
  outcome <- deparse(formula[[2]])
  type <- attr(stats::terms(formula), "term.labels")
  n_group <- dplyr::distinct(data, .data[[type]]) %>% nrow()
  stopifnot(n_group == 2)
  comp <- dplyr::distinct(data, .data[[type]]) %>% unlist() %>% paste(collapse = " |-vs-| ")
  
  miu0 <- data %>%
    dplyr::group_by(.data[[type]]) %>%
    dplyr::summarise(Mean = mean(.data[[outcome]])) %>% 
    dplyr::mutate(miu0 = max(Mean) - min(Mean)) %>% 
    dplyr::distinct(miu0) %>% 
    unlist()
  
  pooledData <- dplyr::pull(data, .data[[outcome]])
  
  meanDiff <- vector("double", reps)
  for (i in 1:reps) {
    idx <- sample(1:nrow(data), nrow(data)/2, replace = FALSE)
    meanDiff[i] <- mean(pooledData[idx]) - mean(pooledData[-idx])
  }
  p <- mean(abs(meanDiff) >= abs(miu0))
  tibble::tibble(comparison = comp,
         p.value = p
  ) %>% 
    rstatix::add_significance()
}