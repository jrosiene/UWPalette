\name{display_uw_palettes}
\alias{display_uw_palettes}
\title{Display UW Color Palettes}
\usage{
display_uw_palettes(palette = NULL, show_hex = TRUE)
}
\arguments{
\item{palette}{Character string specifying which palette to display. If NULL (default),
displays all available palettes. Options: "primary", "secondary", "accent", "muted".}
\item{show_hex}{Logical indicating whether to display hex color codes on the plot.
Default is TRUE.}
}
\value{
Invisibly returns the colors used in the display as a list (for all palettes) 
or character vector (for single palette).
}
\description{
Creates a visual display of all available University of Washington color palettes
or a specific palette. This function is useful for exploring available colors
and their visual relationships.
}
\details{
This function provides an easy way to visualize UW color palettes using base R 
graphics. When displaying all palettes, the function creates a 2x2 grid layout. 
For single palettes, a single bar chart is created.

The function can optionally display hex color codes as labels, which is helpful 
for identifying specific colors for use in other applications.
}
\examples{
# Display all palettes
\dontrun{
display_uw_palettes()
}

# Display specific palette
\dontrun{
display_uw_palettes("accent")
}

# Display without hex codes for cleaner appearance
\dontrun{
display_uw_palettes("primary", show_hex = FALSE)
}

# Capture colors for further use
\dontrun{
colors <- display_uw_palettes("muted")
print(colors)
}
}
\seealso{
\code{\link{uw_palette}} for programmatic access to colors,
\code{\link{uw_palettes}} for direct data access.
}
\author{
Joel Rosiene, MD
}
\keyword{color}
\keyword{palette}
\keyword{graphics}
\keyword{visualization}