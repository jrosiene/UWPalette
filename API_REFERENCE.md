# UWPalette API Reference

This document provides a comprehensive reference for all public APIs, functions, and components in the UWPalette package.

## Table of Contents

- [Functions](#functions)
  - [uw_palette()](#uw_palette)
  - [display_uw_palettes()](#display_uw_palettes)
  - [uw_gradient()](#uw_gradient)
  - [uw_palette_info()](#uw_palette_info)
- [Data Objects](#data-objects)
  - [uw_palettes](#uw_palettes)
- [Color Palettes](#color-palettes)
- [Usage Examples](#usage-examples)
- [Integration Guidelines](#integration-guidelines)

---

## Functions

### uw_palette()

**Primary function for accessing University of Washington color palettes.**

#### Syntax
```r
uw_palette(name = "primary", n)
```

#### Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | character | `"primary"` | Name of the palette. Options: `"primary"`, `"secondary"`, `"accent"`, `"muted"` |
| `n` | integer | (optional) | Number of colors to return. If missing, returns all colors in the palette |

#### Returns
- **Type**: `character vector`
- **Description**: Hexadecimal color codes from the specified palette

#### Examples
```r
# Get all primary colors
uw_palette("primary")
#> [1] "#39275B" "#DFDDE8"

# Get first 3 secondary colors
uw_palette("secondary", 3)
#> [1] "#C79900" "#D7C896" "#8E632A"

# Use in visualization
barplot(1:4, col = uw_palette("accent", 4))
```

#### Error Handling
- Throws error if `name` is not a valid palette name
- Throws error if `n` is not a positive integer
- Returns available colors if `n` exceeds palette size

---

### display_uw_palettes()

**Creates visual displays of UW color palettes for exploration and reference.**

#### Syntax
```r
display_uw_palettes(palette = NULL, show_hex = TRUE)
```

#### Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `palette` | character | `NULL` | Specific palette to display. If `NULL`, displays all palettes |
| `show_hex` | logical | `TRUE` | Whether to display hex color codes on the plot |

#### Returns
- **Type**: `list` (for all palettes) or `character vector` (for single palette)
- **Description**: Invisibly returns the colors used in the display

#### Examples
```r
# Display all palettes
display_uw_palettes()

# Display specific palette without hex codes
display_uw_palettes("accent", show_hex = FALSE)

# Capture colors for further use
colors <- display_uw_palettes("muted")
```

#### Visual Output
- Creates 2×2 grid layout for all palettes
- Single bar chart for individual palettes
- Optional hex code labels for color identification

---

### uw_gradient()

**Creates color interpolation functions using UW colors for smooth gradients.**

#### Syntax
```r
uw_gradient(palette = "primary", reverse = FALSE)
```

#### Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `palette` | character | `"primary"` | Base palette for the gradient |
| `reverse` | logical | `FALSE` | Whether to reverse the color order |

#### Returns
- **Type**: `function`
- **Description**: A function that takes integer `n` and returns `n` interpolated colors

#### Examples
```r
# Create gradient function
primary_grad <- uw_gradient("primary")
colors_10 <- primary_grad(10)

# Reversed gradient
accent_rev <- uw_gradient("accent", reverse = TRUE)
colors_20 <- accent_rev(20)

# Use in heatmap
heatmap(matrix(rnorm(100), 10), col = uw_gradient("muted")(50))
```

#### Use Cases
- Continuous color scales for data visualization
- Heatmaps and contour plots
- Smooth color transitions
- Extending small palettes to larger color sets

---

### uw_palette_info()

**Returns detailed metadata about UW color palettes.**

#### Syntax
```r
uw_palette_info(palette = NULL)
```

#### Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `palette` | character | `NULL` | Specific palette for information. If `NULL`, returns info for all palettes |

#### Returns
- **Type**: `data.frame`
- **Columns**:
  - `palette`: Palette name
  - `position`: Color position within palette (1-based)
  - `hex_code`: Hexadecimal color code
  - `description`: Human-readable color description

#### Examples
```r
# Get all palette information
all_info <- uw_palette_info()

# Get specific palette info
primary_info <- uw_palette_info("primary")

# Access specific information
secondary_info <- uw_palette_info("secondary")
print(secondary_info$hex_code)  # Just hex codes
print(secondary_info$description)  # Just descriptions
```

#### Data Analysis
```r
# Summary statistics
info <- uw_palette_info()
summary_table <- aggregate(position ~ palette, data = info, 
                          FUN = function(x) length(x))

# Filter by criteria
accent_colors <- subset(info, palette == "accent")
first_colors <- subset(info, position == 1)
```

---

## Data Objects

### uw_palettes

**Named list containing all UW color palette data.**

#### Structure
```r
uw_palettes <- list(
  "primary" = c("#39275B", "#DFDDE8"),
  "secondary" = c("#C79900", "#D7C896", "#8E632A", "#000000", "#FFFFFF", "#5D5D5D"),
  "accent" = c("#EBB700", "#5B8F22", "#0046AD", "#63B1E5", "#EDE8C4", "#C75B12"),
  "muted" = c("#C79900", "#898F4B", "#165788", "#93B1CC", "#DBCEAC", "#BD4F19")
)
```

#### Access Methods
```r
# Direct access
uw_palettes$primary
uw_palettes[["secondary"]]

# Get all palette names
names(uw_palettes)

# Get palette sizes
sapply(uw_palettes, length)
```

#### Properties
- **Type**: `list` of `character vectors`
- **Elements**: 4 named palettes
- **Total Colors**: 20 unique colors across all palettes
- **Format**: Hexadecimal color codes (e.g., "#39275B")

---

## Color Palettes

### Primary Palette
**Core UW brand colors for main branding elements**

| Color Name | Hex Code | Preview |
|------------|----------|---------|
| UW Purple (Primary Brand) | `#39275B` | ![](https://img.shields.io/badge/color-39275B-39275B?style=flat-square&logo=) |
| Light Purple (Complementary) | `#DFDDE8` | ![](https://img.shields.io/badge/color-DFDDE8-DFDDE8?style=flat-square&logo=) |

**Usage**: Titles, headers, primary brand elements, main visual hierarchy

### Secondary Palette
**Extended colors for supporting design elements**

| Color Name | Hex Code | Preview |
|------------|----------|---------|
| Gold | `#C79900` | ![](https://img.shields.io/badge/color-C79900-C79900?style=flat-square&logo=) |
| Light Gold | `#D7C896` | ![](https://img.shields.io/badge/color-D7C896-D7C896?style=flat-square&logo=) |
| Bronze | `#8E632A` | ![](https://img.shields.io/badge/color-8E632A-8E632A?style=flat-square&logo=) |
| Black | `#000000` | ![](https://img.shields.io/badge/color-000000-000000?style=flat-square&logo=) |
| White | `#FFFFFF` | ![](https://img.shields.io/badge/color-FFFFFF-FFFFFF?style=flat-square&logo=) |
| Dark Gray | `#5D5D5D` | ![](https://img.shields.io/badge/color-5D5D5D-5D5D5D?style=flat-square&logo=) |

**Usage**: Text, backgrounds, secondary design elements, neutrals

### Accent Palette
**Vibrant colors for highlighting and visual interest**

| Color Name | Hex Code | Preview |
|------------|----------|---------|
| Bright Gold | `#EBB700` | ![](https://img.shields.io/badge/color-EBB700-EBB700?style=flat-square&logo=) |
| Forest Green | `#5B8F22` | ![](https://img.shields.io/badge/color-5B8F22-5B8F22?style=flat-square&logo=) |
| Royal Blue | `#0046AD` | ![](https://img.shields.io/badge/color-0046AD-0046AD?style=flat-square&logo=) |
| Sky Blue | `#63B1E5` | ![](https://img.shields.io/badge/color-63B1E5-63B1E5?style=flat-square&logo=) |
| Cream | `#EDE8C4` | ![](https://img.shields.io/badge/color-EDE8C4-EDE8C4?style=flat-square&logo=) |
| Orange | `#C75B12` | ![](https://img.shields.io/badge/color-C75B12-C75B12?style=flat-square&logo=) |

**Usage**: Call-to-action elements, highlights, data visualization, emphasis

### Muted Palette
**Subdued tones for backgrounds and subtle elements**

| Color Name | Hex Code | Preview |
|------------|----------|---------|
| Muted Gold | `#C79900` | ![](https://img.shields.io/badge/color-C79900-C79900?style=flat-square&logo=) |
| Olive Green | `#898F4B` | ![](https://img.shields.io/badge/color-898F4B-898F4B?style=flat-square&logo=) |
| Navy Blue | `#165788` | ![](https://img.shields.io/badge/color-165788-165788?style=flat-square&logo=) |
| Dusty Blue | `#93B1CC` | ![](https://img.shields.io/badge/color-93B1CC-93B1CC?style=flat-square&logo=) |
| Beige | `#DBCEAC` | ![](https://img.shields.io/badge/color-DBCEAC-DBCEAC?style=flat-square&logo=) |
| Rust | `#BD4F19` | ![](https://img.shields.io/badge/color-BD4F19-BD4F19?style=flat-square&logo=) |

**Usage**: Backgrounds, subtle design elements, secondary data visualization

---

## Usage Examples

### Basic Color Access
```r
library(UWPalette)

# Get specific colors
primary_colors <- uw_palette("primary")
three_accent <- uw_palette("accent", 3)

# Direct access to palette data
all_secondary <- uw_palettes$secondary
palette_names <- names(uw_palettes)
```

### Base R Graphics Integration
```r
# Bar chart
barplot(1:6, col = uw_palette("accent"), 
        main = "Sample Chart with UW Colors")

# Pie chart
pie(c(30, 25, 20, 15, 10), 
    col = uw_palette("muted", 5),
    main = "Distribution with UW Muted Palette")

# Scatter plot with groups
colors <- uw_palette("secondary", 3)
plot(mtcars$wt, mtcars$mpg, 
     col = colors[factor(mtcars$cyl)],
     pch = 19)
```

### ggplot2 Integration
```r
library(ggplot2)

# Discrete colors
ggplot(data, aes(x = category, y = value, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = uw_palette("accent"))

# Continuous gradient
gradient_colors <- uw_gradient("primary")(100)
ggplot(data, aes(x = x, y = y, fill = z)) +
  geom_tile() +
  scale_fill_gradientn(colors = gradient_colors)
```

### Advanced Gradient Usage
```r
# Create custom gradients
primary_grad <- uw_gradient("primary")
accent_grad <- uw_gradient("accent", reverse = TRUE)

# Use in heatmaps
heatmap(cor(mtcars), col = primary_grad(50))

# Multiple gradient comparison
par(mfrow = c(2, 2))
for (pal in names(uw_palettes)) {
  grad <- uw_gradient(pal)
  image(matrix(1:50, nrow = 1), col = grad(50), 
        main = paste("UW", pal, "Gradient"))
}
```

### Palette Information and Analysis
```r
# Get comprehensive palette information
info <- uw_palette_info()

# Analyze palette structure
palette_summary <- aggregate(position ~ palette, data = info, 
                           FUN = function(x) length(x))

# Filter and subset
accent_info <- uw_palette_info("accent")
primary_colors_only <- subset(info, palette == "primary")
```

---

## Integration Guidelines

### Color Selection Best Practices

#### For Data Visualization
1. **Categorical Data**: Use distinct colors from accent or secondary palettes
2. **Continuous Data**: Use gradients created with `uw_gradient()`
3. **Hierarchical Data**: Use primary colors for main categories, secondary for subcategories
4. **Time Series**: Use muted palette for multiple series to avoid visual fatigue

#### For Presentations
1. **Titles**: UW Purple (`#39275B`) from primary palette
2. **Body Text**: Black (`#000000`) from secondary palette
3. **Highlights**: Bright Gold (`#EBB700`) from accent palette
4. **Backgrounds**: White (`#FFFFFF`) or Light Purple (`#DFDDE8`)

### Accessibility Considerations

#### Contrast Ratios
- Ensure sufficient contrast between text and background colors
- Test with WCAG contrast ratio guidelines
- Use high-contrast combinations for important information

#### Color Blindness
- Test visualizations with color blindness simulators
- Don't rely solely on color to convey information
- Use patterns or shapes in addition to colors when possible

#### Print Compatibility
- All UW colors are designed for both digital and print media
- Test grayscale conversion to ensure meaning is preserved
- Consider using patterns for black and white printing

### Custom Scale Functions

#### ggplot2 Integration
```r
# Create custom scale functions
scale_color_uw <- function(palette = "primary", ...) {
  ggplot2::discrete_scale("colour", "uw", 
                         function(n) uw_palette(palette, n), ...)
}

scale_fill_uw <- function(palette = "primary", ...) {
  ggplot2::discrete_scale("fill", "uw", 
                         function(n) uw_palette(palette, n), ...)
}

# Usage
ggplot(data, aes(x = x, y = y, color = group)) +
  geom_point() +
  scale_color_uw("accent")
```

### Error Handling and Validation

#### Common Issues and Solutions
1. **Invalid palette names**: Use `names(uw_palettes)` to check available options
2. **Requesting too many colors**: Function returns available colors if `n` exceeds palette size
3. **Color format compatibility**: All functions return standard hex codes compatible with R graphics

#### Debugging Tips
```r
# Check available palettes
names(uw_palettes)

# Verify palette sizes
sapply(uw_palettes, length)

# Test color validity
is_valid_color <- function(color) {
  tryCatch({
    col2rgb(color)
    TRUE
  }, error = function(e) FALSE)
}
```

---

## Version Information

- **Package Version**: 0.1.0
- **R Version Requirement**: R >= 3.5.0
- **Dependencies**: grDevices, tools
- **Suggested Packages**: ggplot2, knitr, rmarkdown

## References

- [University of Washington Web Color Palette Guidelines](https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf)
- [University of Washington Brand Guidelines](https://www.washington.edu/brand/)
- Package GitHub Repository: [https://github.com/your-username/UWPalette](https://github.com/your-username/UWPalette)

---

*This API reference is current as of UWPalette version 0.1.0. For the most up-to-date information, please refer to the package documentation and GitHub repository.*