# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

uw_palettes <- list(
  "primary" = c("#39275B", "#DFDDE8"),  # UW purple and gold
  "secondary" = c("#C79900","#d7c896","#8E632A","#000000","#ffffff", "#5d5d5d"),
  "accent" = c("#EBB700","#5b8f22","#0046AD","#63B1E5","#EDE8C4","#C75B12"),
  "muted" = c("#C79900","#898F4B","#165788","#93B1CC","#DBCEAC","#BD4F19")
  # Add other palettes
)

uw_palette <- function(name = "primary", n) {
  pal <- uw_palettes[[name]]
  if (missing(n)) {
    n <- length(pal)
  }
  return(pal[1:n])
}
