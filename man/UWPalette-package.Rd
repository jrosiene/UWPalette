\name{UWPalette-package}
\alias{UWPalette-package}
\alias{UWPalette}
\docType{package}
\title{
University of Washington Color Palettes for R
}
\description{
The UWPalette package provides comprehensive access to University of Washington's 
official web color palettes for data visualization, graphics, and design applications 
in R. This package implements the color schemes defined in UW's brand guidelines, 
ensuring consistent and professional visual presentations.
}
\details{
\tabular{ll}{
Package: \tab UWPalette\cr
Type: \tab Package\cr
Version: \tab 0.1.0\cr
License: \tab MIT License\cr
LazyData: \tab true\cr
}

The UWPalette package offers four carefully curated color palettes based on the 
University of Washington's official brand guidelines:

\strong{Primary Palette} (\code{"primary"}): Core UW brand colors featuring the 
iconic UW Purple and complementary tones. Essential for main branding elements.

\strong{Secondary Palette} (\code{"secondary"}): Extended color set including 
metallics and neutrals that support the primary palette. Ideal for text, 
backgrounds, and secondary design elements.

\strong{Accent Palette} (\code{"accent"}): Vibrant colors for highlighting and 
creating visual interest. Should be used sparingly for maximum impact.

\strong{Muted Palette} (\code{"muted"}): Subdued tones perfect for backgrounds 
and subtle design elements while maintaining brand consistency.

\strong{Key Features:}
\itemize{
  \item Brand-compliant color schemes following UW guidelines
  \item Easy integration with ggplot2, base R graphics, and other visualization packages
  \item Flexible color selection with customizable palette sizes
  \item Professional color schemes suitable for academic and business presentations
  \item Comprehensive documentation with practical examples
}

\strong{Main Functions:}
\itemize{
  \item \code{\link{uw_palette}()}: Primary function for accessing color palettes
  \item \code{\link{uw_palettes}}: Direct access to the underlying palette data
}
}
\usage{
# Load the package
library(UWPalette)

# Basic usage
uw_palette(name = "primary", n)
}
\arguments{
\item{name}{Character string specifying the palette name: "primary", "secondary", "accent", or "muted"}
\item{n}{Optional integer specifying number of colors to return}
}
\examples{
# Load the package
library(UWPalette)

# Get all available palettes
names(uw_palettes)

# Basic palette access
primary <- uw_palette("primary")
secondary <- uw_palette("secondary", 4)

# Quick visualization of all palettes
\dontrun{
par(mfrow = c(2, 2), mar = c(3, 2, 2, 1))
for (pal_name in names(uw_palettes)) {
  colors <- uw_palette(pal_name)
  barplot(rep(1, length(colors)), 
          col = colors,
          main = paste("UW", pal_name),
          axes = FALSE)
}
}

# Integration with ggplot2
\dontrun{
library(ggplot2)

# Sample data
data <- data.frame(
  category = LETTERS[1:6],
  values = c(23, 45, 56, 78, 32, 12)
)

# Create plot with UW colors
ggplot(data, aes(x = category, y = values, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = uw_palette("accent")) +
  theme_minimal() +
  labs(title = "Sample Chart with UW Accent Palette")
}

# Base R graphics example
\dontrun{
# Pie chart with muted colors
pie_data <- c(30, 25, 20, 15, 10)
pie(pie_data, 
    col = uw_palette("muted", 5),
    main = "Sample Pie Chart with UW Muted Palette")
}

# Color interpolation for gradients
\dontrun{
# Create smooth gradient
gradient_func <- colorRampPalette(uw_palette("primary"))
smooth_colors <- gradient_func(50)

# Use in heatmap
set.seed(123)
data_matrix <- matrix(rnorm(100), nrow = 10)
heatmap(data_matrix, col = smooth_colors, 
        main = "Heatmap with UW Primary Gradient")
}
}
\author{
Joel Rosiene, MD

Maintainer: Joel Rosiene <jrosiene@uw.edu>
}
\references{
University of Washington Web Color Palette Guidelines: 
\url{https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf}

University of Washington Brand Guidelines: 
\url{https://www.washington.edu/brand/}

R Color Palettes and Visualization:
Wickham, H. (2016). ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York.
}
\seealso{
Useful links:
\itemize{
  \item Package GitHub repository: \url{https://github.com/your-username/UWPalette}
  \item UW Brand Guidelines: \url{https://www.washington.edu/brand/}
  \item Report bugs: \url{https://github.com/your-username/UWPalette/issues}
}

Similar packages:
\itemize{
  \item \code{RColorBrewer}: ColorBrewer palettes for R
  \item \code{viridis}: Default color maps from matplotlib
  \item \code{wesanderson}: Color palettes from Wes Anderson films
}
}
\keyword{package}
\keyword{color}
\keyword{palette}
\keyword{visualization}
\keyword{graphics}