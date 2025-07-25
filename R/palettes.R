#' University of Washington Color Palettes
#'
#' A comprehensive collection of University of Washington's official web color palettes.
#' This data object contains all available color schemes organized by their intended use
#' and visual characteristics, following UW brand guidelines.
#'
#' @format A named list with 4 elements:
#' \describe{
#'   \item{primary}{Core UW brand colors: UW Purple (#39275B), Light Purple (#DFDDE8)}
#'   \item{secondary}{Extended colors: Gold (#C79900), Light Gold (#D7C896), Bronze (#8E632A), Black (#000000), White (#FFFFFF), Dark Gray (#5D5D5D)}
#'   \item{accent}{Vibrant colors: Bright Gold (#EBB700), Forest Green (#5B8F22), Royal Blue (#0046AD), Sky Blue (#63B1E5), Cream (#EDE8C4), Orange (#C75B12)}
#'   \item{muted}{Subdued colors: Muted Gold (#C79900), Olive Green (#898F4B), Navy Blue (#165788), Dusty Blue (#93B1CC), Beige (#DBCEAC), Rust (#BD4F19)}
#' }
#'
#' @source University of Washington Web Color Palette Guidelines:
#'   \url{https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf}
#'
#' @examples
#' # Access all palettes
#' names(uw_palettes)
#'
#' # Get specific palette directly
#' uw_palettes$primary
#' uw_palettes[["secondary"]]
#'
#' @export
uw_palettes <- list(
  "primary" = c("#39275B", "#DFDDE8"),  # UW Purple and Light Purple
  "secondary" = c("#C79900", "#D7C896", "#8E632A", "#000000", "#FFFFFF", "#5D5D5D"),  # Gold, Light Gold, Bronze, Black, White, Dark Gray
  "accent" = c("#EBB700", "#5B8F22", "#0046AD", "#63B1E5", "#EDE8C4", "#C75B12"),  # Bright Gold, Forest Green, Royal Blue, Sky Blue, Cream, Orange
  "muted" = c("#C79900", "#898F4B", "#165788", "#93B1CC", "#DBCEAC", "#BD4F19")  # Muted Gold, Olive Green, Navy Blue, Dusty Blue, Beige, Rust
)

#' University of Washington Color Palette Function
#'
#' Retrieves colors from University of Washington's official web color palettes.
#' This function provides access to UW's brand-compliant color schemes suitable
#' for data visualization, graphics, and web design.
#'
#' @param name Character string specifying the palette name. Available options are:
#'   \itemize{
#'     \item \code{"primary"} - Core UW brand colors (UW Purple and Light Purple)
#'     \item \code{"secondary"} - Extended colors for supporting design elements
#'     \item \code{"accent"} - Vibrant colors for highlighting and accent elements
#'     \item \code{"muted"} - Subdued tones for backgrounds and subtle design elements
#'   }
#'   Default is \code{"primary"}.
#' @param n Integer specifying the number of colors to return from the palette.
#'   If missing, returns all colors in the specified palette. If \code{n} exceeds
#'   the number of available colors in the palette, only the available colors are returned.
#'
#' @return A character vector of hexadecimal color codes.
#'
#' @details The UWPalette package implements the color schemes defined in the University
#'   of Washington Web Color Palette guidelines. All palettes follow UW brand
#'   standards and are suitable for professional and academic use.
#'
#' @examples
#' # Get all colors from primary palette
#' uw_palette("primary")
#'
#' # Get first 3 colors from accent palette
#' uw_palette("accent", 3)
#'
#' # Use with base R graphics
#' barplot(1:4, col = uw_palette("secondary", 4))
#'
#' # Use with ggplot2
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
#'   geom_bar() +
#'   scale_fill_manual(values = uw_palette("accent", 3))
#' }
#'
#' @seealso \code{\link{uw_palettes}} for direct access to the palette data structure.
#'
#' @export
uw_palette <- function(name = "primary", n) {
  # Validate palette name
  if (!name %in% names(uw_palettes)) {
    stop("Palette name '", name, "' not found. Available palettes: ", 
         paste(names(uw_palettes), collapse = ", "))
  }
  
  # Get the requested palette
  pal <- uw_palettes[[name]]
  
  # If n is not specified, return all colors
  if (missing(n)) {
    n <- length(pal)
  }
  
  # Validate n parameter
  if (!is.numeric(n) || n <= 0) {
    stop("Parameter 'n' must be a positive integer")
  }
  
  # Return requested number of colors (or all available if n exceeds palette length)
  return(pal[1:min(n, length(pal))])
}

#' Display UW Color Palettes
#'
#' Creates a visual display of all available University of Washington color palettes
#' or a specific palette. This function is useful for exploring available colors
#' and their visual relationships.
#'
#' @param palette Character string specifying which palette to display. If NULL (default),
#'   displays all available palettes. Options: "primary", "secondary", "accent", "muted".
#' @param show_hex Logical indicating whether to display hex color codes on the plot.
#'   Default is TRUE.
#'
#' @return Invisibly returns the colors used in the display.
#'
#' @examples
#' # Display all palettes
#' \dontrun{
#' display_uw_palettes()
#' }
#'
#' # Display specific palette
#' \dontrun{
#' display_uw_palettes("accent")
#' }
#'
#' # Display without hex codes
#' \dontrun{
#' display_uw_palettes("primary", show_hex = FALSE)
#' }
#'
#' @export
display_uw_palettes <- function(palette = NULL, show_hex = TRUE) {
  if (is.null(palette)) {
    # Display all palettes
    old_par <- par(mfrow = c(2, 2), mar = c(3, 2, 3, 1))
    on.exit(par(old_par))
    
    all_colors <- list()
    for (pal_name in names(uw_palettes)) {
      colors <- uw_palettes[[pal_name]]
      all_colors[[pal_name]] <- colors
      
      barplot(rep(1, length(colors)), 
              col = colors,
              main = paste("UW", tools::toTitleCase(pal_name), "Palette"),
              axes = FALSE,
              names.arg = if (show_hex) colors else seq_along(colors),
              cex.names = if (show_hex) 0.7 else 1,
              las = 2)
    }
    return(invisible(all_colors))
    
  } else {
    # Display specific palette
    if (!palette %in% names(uw_palettes)) {
      stop("Palette '", palette, "' not found. Available: ", 
           paste(names(uw_palettes), collapse = ", "))
    }
    
    colors <- uw_palettes[[palette]]
    barplot(rep(1, length(colors)), 
            col = colors,
            main = paste("UW", tools::toTitleCase(palette), "Palette"),
            axes = FALSE,
            names.arg = if (show_hex) colors else seq_along(colors),
            cex.names = if (show_hex) 0.8 else 1,
            las = 2)
    
    return(invisible(colors))
  }
}

#' Create UW Color Gradient
#'
#' Creates a color gradient function using University of Washington colors.
#' This function is useful for creating smooth color transitions for heatmaps,
#' continuous scales, and other gradient-based visualizations.
#'
#' @param palette Character string specifying the base palette for the gradient.
#'   Options: "primary", "secondary", "accent", "muted". Default is "primary".
#' @param reverse Logical indicating whether to reverse the color order. Default is FALSE.
#'
#' @return A function that takes an integer n and returns n colors interpolated
#'   from the specified UW palette.
#'
#' @examples
#' # Create a gradient function from primary palette
#' primary_gradient <- uw_gradient("primary")
#' colors_10 <- primary_gradient(10)
#'
#' # Create reversed accent gradient
#' accent_rev <- uw_gradient("accent", reverse = TRUE)
#' colors_20 <- accent_rev(20)
#'
#' # Use in heatmap
#' \dontrun{
#' gradient_func <- uw_gradient("muted")
#' heatmap(matrix(rnorm(100), 10), col = gradient_func(50))
#' }
#'
#' @export
uw_gradient <- function(palette = "primary", reverse = FALSE) {
  if (!palette %in% names(uw_palettes)) {
    stop("Palette '", palette, "' not found. Available: ", 
         paste(names(uw_palettes), collapse = ", "))
  }
  
  colors <- uw_palettes[[palette]]
  if (reverse) {
    colors <- rev(colors)
  }
  
  return(grDevices::colorRampPalette(colors))
}

#' Get UW Palette Information
#'
#' Returns detailed information about University of Washington color palettes,
#' including color names, hex codes, and usage recommendations.
#'
#' @param palette Character string specifying which palette to get information for.
#'   If NULL (default), returns information for all palettes.
#'
#' @return A data frame with palette information including palette name, color position,
#'   hex code, and color description.
#'
#' @examples
#' # Get information for all palettes
#' uw_palette_info()
#'
#' # Get information for specific palette
#' uw_palette_info("primary")
#'
#' @export
uw_palette_info <- function(palette = NULL) {
  # Color descriptions for each palette
  color_descriptions <- list(
    "primary" = c("UW Purple (Primary Brand)", "Light Purple (Complementary)"),
    "secondary" = c("Gold", "Light Gold", "Bronze", "Black", "White", "Dark Gray"),
    "accent" = c("Bright Gold", "Forest Green", "Royal Blue", "Sky Blue", "Cream", "Orange"),
    "muted" = c("Muted Gold", "Olive Green", "Navy Blue", "Dusty Blue", "Beige", "Rust")
  )
  
  if (is.null(palette)) {
    # Return info for all palettes
    all_info <- data.frame()
    for (pal_name in names(uw_palettes)) {
      colors <- uw_palettes[[pal_name]]
      descriptions <- color_descriptions[[pal_name]]
      
      pal_info <- data.frame(
        palette = pal_name,
        position = seq_along(colors),
        hex_code = colors,
        description = descriptions,
        stringsAsFactors = FALSE
      )
      all_info <- rbind(all_info, pal_info)
    }
    return(all_info)
    
  } else {
    # Return info for specific palette
    if (!palette %in% names(uw_palettes)) {
      stop("Palette '", palette, "' not found. Available: ", 
           paste(names(uw_palettes), collapse = ", "))
    }
    
    colors <- uw_palettes[[palette]]
    descriptions <- color_descriptions[[palette]]
    
    return(data.frame(
      palette = palette,
      position = seq_along(colors),
      hex_code = colors,
      description = descriptions,
      stringsAsFactors = FALSE
    ))
  }
}
