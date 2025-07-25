\name{uw_palette}
\alias{uw_palette}
\title{University of Washington Color Palette Function}
\usage{
uw_palette(name = "primary", n)
}
\arguments{
\item{name}{Character string specifying the palette name. Available options are:
  \itemize{
    \item \code{"primary"} - Core UW brand colors (UW Purple and Light Purple)
    \item \code{"secondary"} - Extended colors for supporting design elements
    \item \code{"accent"} - Vibrant colors for highlighting and accent elements  
    \item \code{"muted"} - Subdued tones for backgrounds and subtle design elements
  }
  Default is \code{"primary"}.}
\item{n}{Integer specifying the number of colors to return from the palette. 
  If missing, returns all colors in the specified palette. If \code{n} exceeds 
  the number of available colors in the palette, only the available colors are returned.}
}
\value{
A character vector of hexadecimal color codes.
}
\description{
Retrieves colors from University of Washington's official web color palettes. 
This function provides access to UW's brand-compliant color schemes suitable 
for data visualization, graphics, and web design.
}
\details{
The UWPalette package implements the color schemes defined in the University 
of Washington Web Color Palette guidelines. All palettes follow UW brand 
standards and are suitable for professional and academic use.

Available palettes contain the following colors:
\itemize{
  \item \strong{primary}: 2 colors - UW Purple (#39275B), Light Purple (#DFDDE8)
  \item \strong{secondary}: 6 colors - Gold, Light Gold, Bronze, Black, White, Dark Gray
  \item \strong{accent}: 6 colors - Bright Gold, Forest Green, Royal Blue, Sky Blue, Cream, Orange
  \item \strong{muted}: 6 colors - Muted Gold, Olive Green, Navy Blue, Dusty Blue, Beige, Rust
}
}
\examples{
# Get all colors from primary palette
uw_palette("primary")

# Get all colors from secondary palette  
uw_palette("secondary")

# Get first 3 colors from accent palette
uw_palette("accent", 3)

# Get 4 colors from muted palette
uw_palette("muted", 4)

# Use with base R graphics
barplot(1:4, col = uw_palette("accent", 4), 
        main = "Sample Plot with UW Colors")

# Use with ggplot2 (requires ggplot2 package)
\dontrun{
library(ggplot2)
data <- data.frame(x = 1:5, y = c(2, 5, 3, 8, 7))
ggplot(data, aes(x = factor(x), y = y, fill = factor(x))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = uw_palette("secondary", 5))
}
}
\references{
University of Washington Web Color Palette Guidelines: 
\url{https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf}
}
\seealso{
\code{\link{uw_palettes}} for direct access to the palette data structure.
}
\author{
Joel Rosiene, MD
}
\keyword{color}
\keyword{palette}
\keyword{graphics}
