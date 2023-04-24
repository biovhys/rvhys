#' @title 根据intron ID提取DNA序列
#'
#' @param intron 
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_intronID2seq("AT4G25590.1intron1")
#' 
rvhys_intronID2seq <- function(intron) {
  txdb <- AnnotationDbi::loadDb(rvhys_extdata("TxDb.Arabidopsis_thaliana.TAIR10.47.sqlite"))
  intron_arab <- unlist(rvhys_Arabidopsis.thaliana.TAIR10.47.intron.GRList) # 载入intron注释
  intron_gr <-  intron_arab[intron_arab$intron_name == intron]   #获取intron坐标
  names(intron_gr) = NULL  #去除行名
  # 获取序列
  Biostrings::getSeq(rvhys_Arabidopsis.thaliana.genome,intron_gr) %>% 
    toString()
}