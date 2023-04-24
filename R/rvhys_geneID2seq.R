#' @title 根据Gene ID提取DNA序列
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_geneID2seq("At1g13320")
#' 
rvhys_geneID2seq <- function(gene){
  txdb <- AnnotationDbi::loadDb(rvhys_extdata("TxDb.Arabidopsis_thaliana.TAIR10.47.sqlite"))
  gene_gr <- GenomicFeatures::genes(txdb)[stringr::str_to_upper(gene)] # 获取基因坐标
  names(gene_gr) <- NULL # 去除行名
  Biostrings::getSeq(rvhys_Arabidopsis.thaliana.genome, gene_gr)
}