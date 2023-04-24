#' @title extract DNA sequence from Chr, start, end and strand
#'
#' @return
#' @export
#'
#' @examples
#' rvhys_getDNAseq(3,19329976,19330011,"+")
#'
rvhys_getDNAseq <- function(chr,start,end,strand){
  # genome <-  BSgenome.Athaliana.TAIR.TAIR9::BSgenome.Athaliana.TAIR.TAIR9
  # GenomeInfoDb::seqnames(genome) <-  c("1","2","3","4","5","Mt","Pt")   #载入参考基因组并转换ID
  granges <-  GenomicRanges::GRanges(seqnames = chr,
                                     ranges = IRanges::IRanges(start = start,end = end),
                                     strand = strand)
  Biostrings::getSeq(rvhys_Arabidopsis.thaliana.genome, granges) %>% 
    toString()  #检索序列信息
}
