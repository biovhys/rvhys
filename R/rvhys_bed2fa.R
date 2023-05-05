#' @title extract DNA sequence from bed file
#'
#' @param bed_file
#'
#' @return
#' @export
#'
#' @examples
bed2fa <- function(bed_file) {
  # genome <- BSgenome.Athaliana.TAIR.TAIR9::BSgenome.Athaliana.TAIR.TAIR9
  # GenomeInfoDb::seqnames(genome) <- c("1", "2", "3", "4", "5", "Mt", "Pt") # 载入参考基因组并转换ID
  query_gr <- readr::read_tsv(bed_file, col_names = F) %>%
    purrr::set_names(c("intron_name", "chromosome", "start", "end", "strand")) %>%
    GenomicRanges::makeGRangesFromDataFrame(keep.extra.columns = T) # 生成gr
  names(query_gr) <- query_gr$intron_name # 添加names，将作为fasta序列的名字
  out_file <- stringr::str_replace(bed_file, ".*/(.*)bed", "\\1fa")
  Biostrings::getSeq(rvhys_Arabidopsis.thaliana.genome, query_gr) %>%
    Biostrings::writeXStringSet(str_c("/home/zhangy/ngsdata/20210928circRNA-seq/RNA_secondary_structure/query_seq/", out_file),
      append = T,
      format = "fasta"
    ) # 检索并写入fasta文件
}
