# Script to create color palette visualization images for GitHub
# This script generates PNG images showing the UW color palettes

library(UWPalette)

# Create inst directory if it doesn't exist
if (!dir.exists("inst")) {
  dir.create("inst", recursive = TRUE)
}

# Function to create a color palette image
create_palette_image <- function(palette_name, filename, width = 600, height = 100) {
  colors <- uw_palette(palette_name)
  n_colors <- length(colors)
  
  # Create PNG file
  png(filename, width = width, height = height, res = 150)
  par(mar = c(0, 0, 0, 0))
  
  # Create color swatches
  plot(0, 0, type = "n", xlim = c(0, n_colors), ylim = c(0, 1), 
       axes = FALSE, xlab = "", ylab = "")
  
  for (i in 1:n_colors) {
    rect(i-1, 0, i, 1, col = colors[i], border = "white", lwd = 2)
    
    # Add hex code text
    text(i-0.5, 0.5, colors[i], 
         col = if (colors[i] %in% c("#000000", "#39275B", "#165788", "#0046AD", "#5B8F22", 
                                   "#8E632A", "#898F4B", "#BD4F19", "#C75B12")) "white" else "black",
         cex = 0.8, font = 2)
  }
  
  dev.off()
  cat("Created:", filename, "\n")
}

# Function to create a combined palette overview image
create_overview_image <- function(filename = "inst/all_palettes.png", width = 800, height = 600) {
  png(filename, width = width, height = height, res = 150)
  par(mfrow = c(2, 2), mar = c(2, 2, 3, 1))
  
  palette_names <- names(uw_palettes)
  for (pal_name in palette_names) {
    colors <- uw_palettes[[pal_name]]
    n_colors <- length(colors)
    
    # Create color swatches
    barplot(rep(1, n_colors), 
            col = colors,
            main = paste("UW", tools::toTitleCase(pal_name), "Palette"),
            axes = FALSE,
            names.arg = colors,
            cex.names = 0.7,
            las = 2,
            border = "white")
  }
  
  dev.off()
  cat("Created overview image:", filename, "\n")
}

# Function to create gradient examples
create_gradient_image <- function(filename = "inst/gradients.png", width = 800, height = 600) {
  png(filename, width = width, height = height, res = 150)
  par(mfrow = c(2, 2), mar = c(2, 2, 3, 1))
  
  palette_names <- names(uw_palettes)
  for (pal_name in palette_names) {
    grad_func <- uw_gradient(pal_name)
    colors <- grad_func(50)
    
    # Create gradient display
    image(matrix(1:50, nrow = 1), 
          col = colors, 
          main = paste("UW", tools::toTitleCase(pal_name), "Gradient"),
          axes = FALSE,
          xlab = "", ylab = "")
  }
  
  dev.off()
  cat("Created gradient image:", filename, "\n")
}

# Create individual palette images
create_palette_image("primary", "inst/primary_palette.png")
create_palette_image("secondary", "inst/secondary_palette.png", width = 900)
create_palette_image("accent", "inst/accent_palette.png", width = 900)
create_palette_image("muted", "inst/muted_palette.png", width = 900)

# Create overview images
create_overview_image()
create_gradient_image()

# Create a demonstration plot
create_demo_plot <- function(filename = "inst/demo_plot.png", width = 800, height = 600) {
  png(filename, width = width, height = height, res = 150)
  
  # Sample data
  set.seed(123)
  categories <- c("Research", "Teaching", "Service", "Admin", "Other")
  values <- c(35, 25, 20, 15, 5)
  
  # Create bar plot
  colors <- uw_palette("accent", 5)
  barplot(values, 
          names.arg = categories,
          col = colors,
          main = "Academic Time Allocation\nUsing UW Accent Palette",
          ylab = "Percentage",
          ylim = c(0, 40),
          border = "white",
          las = 1)
  
  # Add percentage labels
  text(seq(0.7, by = 1.2, length.out = 5), values + 1, 
       paste0(values, "%"), cex = 0.9, font = 2)
  
  dev.off()
  cat("Created demo plot:", filename, "\n")
}

create_demo_plot()

cat("\nAll visualization images have been created in the 'inst/' directory.\n")
cat("These can be used in the README.md and GitHub documentation.\n")

# Print summary information
cat("\nPalette Summary:\n")
for (pal_name in names(uw_palettes)) {
  colors <- uw_palettes[[pal_name]]
  cat(sprintf("%-10s: %d colors - %s\n", 
              tools::toTitleCase(pal_name), 
              length(colors), 
              paste(colors, collapse = ", ")))
}