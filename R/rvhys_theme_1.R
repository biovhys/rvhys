#' @title Custom ggplot2 theme 1
#' @description
#' This function is used to custom ggplot2 theme derived from theme_classic.
#' @importFrom ggplot2 %+replace%
#'
#' @param base_size
#' @param base_family
#' @param base_line_size
#' @param base_rect_size
#'
#' @return
#' @export
#'
#' @examples
#' #' mpg %>%
#' ggplot(aes(cty, hwy)) +
#'   geom_point() +
#'   facet_wrap(~ class) +
#'   rvhys_theme_1()
#'
rvhys_theme_1 <- function(base_size = 6, # base font size, given in pts. 11 change to 6
                          base_family = "",
                          base_line_size = base_size / 22,
                          base_rect_size = base_size / 22) {
  custom <- ggplot2::theme(
    axis.text = element_text(size = rel(1), face = "bold"),
    # axis.text = element_text(size = rel(1), color = "black", face = "bold"),
    axis.title = element_text(size = rel(1), face = "bold", hjust = 0.5),
    # axis.title = element_text(size = rel(1), color = "black", face = "bold", hjust = 0.5),
    # panel.border = element_rect(fill = NA, color = "black", linewidth = rel(0.91)),
    # axis.line = element_line(color = "black", linewidth = rel(0.91)),
    # axis.ticks = element_line(color = "black", linewidth = rel(0.91)),
    # axis.ticks.length = unit(3, "pt"),   # 轴须长度
    plot.title = element_text(size = rel(1), face = "bold"),
    # plot.title = element_text(size = rel(1), color = "black", face = "bold"),
    legend.title = element_text(size = rel(1), face = "bold"),
    # legend.title = element_text(size = rel(1), color = "black", face = "bold"),
    legend.text = element_text(size = rel(1), face = "bold"),
    # legend.text = element_text(size = rel(1), color = "black", face = "bold"),
    legend.title.align = 0.5,
    strip.background = element_blank(),
    strip.text = element_text(size = rel(1), face = "bold"),
    # strip.text = element_text(size = rel(1), color = "black", face = "bold"),
    complete = TRUE)
  ggplot2::theme_classic(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace% custom +
    theme(strip.text = element_text(face = "bold"))
}
