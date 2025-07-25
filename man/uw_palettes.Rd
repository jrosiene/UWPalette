\name{uw_palettes}
\alias{uw_palettes}
\docType{data}
\title{University of Washington Color Palettes Data}
\format{
A named list with 4 elements, each containing a character vector of hexadecimal color codes:
\describe{
  \item{\code{primary}}{A character vector of 2 colors: UW Purple (#39275B) and Light Purple (#DFDDE8)}
  \item{\code{secondary}}{A character vector of 6 colors: Gold (#C79900), Light Gold (#D7C896), Bronze (#8E632A), Black (#000000), White (#FFFFFF), and Dark Gray (#5D5D5D)}
  \item{\code{accent}}{A character vector of 6 colors: Bright Gold (#EBB700), Forest Green (#5B8F22), Royal Blue (#0046AD), Sky Blue (#63B1E5), Cream (#EDE8C4), and Orange (#C75B12)}
  \item{\code{muted}}{A character vector of 6 colors: Muted Gold (#C79900), Olive Green (#898F4B), Navy Blue (#165788), Dusty Blue (#93B1CC), Beige (#DBCEAC), and Rust (#BD4F19)}
}
}
\description{
A comprehensive collection of University of Washington's official web color palettes. 
This data object contains all available color schemes organized by their intended use 
and visual characteristics.
}
\details{
The \code{uw_palettes} list provides direct access to UW's brand-compliant color 
schemes. Each palette serves different design purposes:

\strong{Primary Palette:}
The core UW brand colors featuring the official UW Purple as the primary brand color 
and a complementary light purple tone. These colors should be used for main branding 
elements and primary visual hierarchy.

\strong{Secondary Palette:}
An extended set of colors including metallics (gold, bronze) and neutrals (black, white, gray) 
that support the primary palette. These colors are ideal for text, backgrounds, and 
secondary design elements.

\strong{Accent Palette:}
Vibrant, high-contrast colors designed for highlighting important information, 
call-to-action elements, and creating visual interest. These colors should be used 
sparingly for maximum impact.

\strong{Muted Palette:}
Subdued, low-saturation colors perfect for backgrounds, subtle design elements, 
and situations where colors need to recede into the background while maintaining 
brand consistency.

All colors follow University of Washington brand guidelines and are suitable for 
both digital and print applications.
}
\usage{
uw_palettes
}
\examples{
# Access all palettes
str(uw_palettes)

# Get specific palette directly
primary_colors <- uw_palettes[["primary"]]
secondary_colors <- uw_palettes$secondary

# View all available palette names
names(uw_palettes)

# Get number of colors in each palette
sapply(uw_palettes, length)

# Create a visualization showing all palettes
\dontrun{
# Simple visualization of all palettes
par(mfrow = c(2, 2), mar = c(2, 2, 3, 1))
for (palette_name in names(uw_palettes)) {
  colors <- uw_palettes[[palette_name]]
  barplot(rep(1, length(colors)), 
          col = colors,
          main = paste("UW", palette_name, "Palette"),
          axes = FALSE,
          names.arg = seq_along(colors))
}
par(mfrow = c(1, 1))  # Reset layout
}

# Use with color interpolation
\dontrun{
library(grDevices)
# Create gradient from primary colors
primary_gradient <- colorRampPalette(uw_palettes$primary)
gradient_colors <- primary_gradient(20)

# Display gradient
image(matrix(1:20, nrow = 1), col = gradient_colors, axes = FALSE)
title("UW Primary Palette Gradient")
}
}
\references{
University of Washington Web Color Palette Guidelines: 
\url{https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf}

University of Washington Brand Guidelines: 
\url{https://www.washington.edu/brand/}
}
\seealso{
\code{\link{uw_palette}} for the function interface to access these palettes.
}
\source{
Based on the official University of Washington Web Color Palette as specified 
in the UW External Affairs marketing toolkit.
}
\author{
Joel Rosiene, MD
}
\keyword{datasets}
\keyword{color}
\keyword{palette}