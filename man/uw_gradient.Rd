\name{uw_gradient}
\alias{uw_gradient}
\title{Create UW Color Gradient}
\usage{
uw_gradient(palette = "primary", reverse = FALSE)
}
\arguments{
\item{palette}{Character string specifying the base palette for the gradient.
Options: "primary", "secondary", "accent", "muted". Default is "primary".}
\item{reverse}{Logical indicating whether to reverse the color order. Default is FALSE.}
}
\value{
A function that takes an integer n and returns n colors interpolated
from the specified UW palette.
}
\description{
Creates a color gradient function using University of Washington colors.
This function is useful for creating smooth color transitions for heatmaps,
continuous scales, and other gradient-based visualizations.
}
\details{
This function returns a color interpolation function similar to those created by 
\code{colorRampPalette()}. The returned function can be called with any positive 
integer to generate that many colors along a smooth gradient between the colors 
in the specified UW palette.

This is particularly useful for:
\itemize{
  \item Creating continuous color scales for data visualization
  \item Generating colors for heatmaps and contour plots  
  \item Creating smooth transitions between UW brand colors
  \item Extending small palettes to larger color sets while maintaining brand consistency
}

The \code{reverse} parameter allows you to flip the color order, which can be 
useful for creating different visual effects or matching specific design requirements.
}
\examples{
# Create a gradient function from primary palette
primary_gradient <- uw_gradient("primary")
colors_10 <- primary_gradient(10)
print(colors_10)

# Create reversed accent gradient
accent_rev <- uw_gradient("accent", reverse = TRUE)
colors_20 <- accent_rev(20)

# Use in heatmap
\dontrun{
gradient_func <- uw_gradient("muted")
set.seed(123)
data_matrix <- matrix(rnorm(100), nrow = 10)
heatmap(data_matrix, col = gradient_func(50),
        main = "Heatmap with UW Muted Gradient")
}

# Use with ggplot2 continuous scales
\dontrun{
library(ggplot2)
gradient_colors <- uw_gradient("accent")(100)
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_gradientn(colors = gradient_colors) +
  labs(title = "Faithful Dataset with UW Accent Gradient")
}

# Compare normal and reversed gradients
\dontrun{
par(mfrow = c(2, 1))
normal_grad <- uw_gradient("secondary")
rev_grad <- uw_gradient("secondary", reverse = TRUE)

image(matrix(1:50, nrow = 1), col = normal_grad(50), 
      main = "Normal Secondary Gradient", axes = FALSE)
image(matrix(1:50, nrow = 1), col = rev_grad(50), 
      main = "Reversed Secondary Gradient", axes = FALSE)
}
}
\seealso{
\code{\link{uw_palette}} for discrete color access,
\code{\link{uw_palettes}} for palette data,
\code{\link[grDevices]{colorRampPalette}} for the underlying interpolation function.
}
\author{
Joel Rosiene, MD
}
\keyword{color}
\keyword{palette}
\keyword{gradient}
\keyword{interpolation}