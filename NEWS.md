# UWPalette 0.1.0

## New Features

### Core Functionality
* Added `uw_palette()` function for accessing University of Washington color palettes
* Implemented four comprehensive color palettes based on UW brand guidelines:
  - **Primary**: Core UW brand colors (UW Purple, Light Purple)
  - **Secondary**: Extended colors with metallics and neutrals (Gold, Light Gold, Bronze, Black, White, Dark Gray)
  - **Accent**: Vibrant colors for highlighting (Bright Gold, Forest Green, Royal Blue, Sky Blue, Cream, Orange)
  - **Muted**: Subdued tones for backgrounds (Muted Gold, Olive Green, Navy Blue, Dusty Blue, Beige, Rust)

### Utility Functions
* Added `display_uw_palettes()` for visual exploration of color palettes
* Added `uw_gradient()` for creating color interpolation functions
* Added `uw_palette_info()` for accessing detailed palette metadata

### Data Objects
* Implemented `uw_palettes` list containing all color palette data
* All colors follow official UW Web Color Palette guidelines

## Documentation

### Comprehensive Documentation
* Created detailed README.md with installation instructions, usage examples, and color palette visualizations
* Added complete R documentation (.Rd files) for all functions and data objects
* Implemented roxygen2 comments throughout the codebase
* Created comprehensive vignette with practical examples and best practices

### GitHub Integration
* Added color palette visualizations using placeholder images for GitHub display
* Included examples for both base R graphics and ggplot2 integration
* Provided accessibility considerations and professional usage guidelines

## Examples and Integration

### Base R Graphics
* Bar charts, pie charts, scatter plots, and heatmaps
* Color interpolation and gradient creation
* Multiple palette combinations

### ggplot2 Integration
* Custom scale functions for easy integration
* Continuous and discrete color scales
* Professional visualization examples

### Advanced Features
* Color gradient creation with normal and reversed options
* Palette combination techniques
* Accessibility and contrast considerations

## Technical Improvements

### Code Quality
* Input validation for all functions
* Error handling with informative messages
* Consistent coding style and documentation
* Comprehensive examples in all documentation

### Package Structure
* Proper NAMESPACE exports
* Vignette integration for comprehensive documentation
* NEWS.md for tracking changes and updates

---

## Installation

```r
# Install from GitHub
devtools::install_github("your-username/UWPalette")
```

## Quick Start

```r
library(UWPalette)

# Get UW primary colors
uw_palette("primary")

# Display all palettes
display_uw_palettes()

# Create a gradient
gradient_func <- uw_gradient("accent")
colors <- gradient_func(10)
```

For detailed usage instructions and examples, see the package vignette:
```r
vignette("UWPalette-guide", package = "UWPalette")
```