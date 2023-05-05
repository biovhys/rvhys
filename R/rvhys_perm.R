#' @title convenient permutation test
#'
#' @return
#' @export
#'
#' @examples
#' a <- runif(5, 1, 2)
#' b <- runif(6, 4, 5)
#' rvhys_perm(a, b)
#' 
rvhys_perm <- function(x, y, reps = 10000, seed = 20230425) {
  set.seed(seed)
  miu0 <- mean(y) - mean(x)
  pooledData <- c(x, y)
  meanDiff <- numeric(reps)
  for (i in 1:reps) {
    idx <- sample(1:length(pooledData), length(x), replace = FALSE)
    x <- pooledData[idx]
    y <- pooledData[-idx]
    meanDiff[i] <- mean(y) - mean(x)
  }
  p <- mean(abs(meanDiff) >= abs(miu0))
  return(p)
}