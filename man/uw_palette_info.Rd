\name{uw_palette_info}
\alias{uw_palette_info}
\title{Get UW Palette Information}
\usage{
uw_palette_info(palette = NULL)
}
\arguments{
\item{palette}{Character string specifying which palette to get information for.
If NULL (default), returns information for all palettes. Options: "primary", 
"secondary", "accent", "muted".}
}
\value{
A data frame with palette information including:
\describe{
  \item{palette}{Name of the color palette}
  \item{position}{Position of the color within the palette (1-based indexing)}
  \item{hex_code}{Hexadecimal color code}
  \item{description}{Human-readable description of the color}
}
}
\description{
Returns detailed information about University of Washington color palettes,
including color names, hex codes, and usage recommendations.
}
\details{
This function provides a structured way to access comprehensive information about 
UW color palettes. It returns a data frame that can be easily filtered, sorted, 
or used for generating reports about color usage.

The information includes:
\itemize{
  \item \strong{Palette names}: The four main UW palette categories
  \item \strong{Color positions}: Numerical order within each palette
  \item \strong{Hex codes}: Standard hexadecimal color representations
  \item \strong{Descriptions}: Human-readable color names and usage notes
}

This function is particularly useful for:
\itemize{
  \item Creating color reference documents
  \item Programmatically accessing color metadata
  \item Generating reports about color usage
  \item Understanding the structure and organization of UW palettes
}
}
\examples{
# Get information for all palettes
all_info <- uw_palette_info()
print(all_info)

# Get information for specific palette
primary_info <- uw_palette_info("primary")
print(primary_info)

# View specific information
secondary_info <- uw_palette_info("secondary")
print(secondary_info$hex_code)  # Just the hex codes
print(secondary_info$description)  # Just the descriptions

# Filter information
\dontrun{
all_info <- uw_palette_info()
# Get only accent colors
accent_colors <- subset(all_info, palette == "accent")
print(accent_colors)

# Get colors by position (e.g., first color from each palette)
first_colors <- subset(all_info, position == 1)
print(first_colors)
}

# Create a summary table
\dontrun{
info <- uw_palette_info()
summary_table <- aggregate(position ~ palette, data = info, 
                          FUN = function(x) length(x))
colnames(summary_table) <- c("Palette", "Number_of_Colors")
print(summary_table)
}
}
\seealso{
\code{\link{uw_palette}} for accessing colors,
\code{\link{uw_palettes}} for direct palette data,
\code{\link{display_uw_palettes}} for visual exploration.
}
\author{
Joel Rosiene, MD
}
\keyword{color}
\keyword{palette}
\keyword{information}
\keyword{metadata}