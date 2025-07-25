# UWPalette

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive R package providing University of Washington's official web color palettes for data visualization and graphics. This package implements the color schemes defined in the [UW Web Color Palette guidelines](https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf).

## Installation

You can install the development version of UWPalette from GitHub:

```r
# Install devtools if you haven't already
if (!require(devtools)) {
    install.packages("devtools")
}

# Install UWPalette
devtools::install_github("your-username/UWPalette")
```

## Quick Start

```r
library(UWPalette)

# Get the primary UW palette
primary_colors <- uw_palette("primary")
print(primary_colors)
# [1] "#39275B" "#DFDDE8"

# Get first 3 colors from secondary palette
secondary_colors <- uw_palette("secondary", 3)
print(secondary_colors)
# [1] "#C79900" "#D7C896" "#8E632A"
```

## Available Color Palettes

### Primary Palette
The core UW brand colors featuring the official UW Purple and complementary tones.

```r
uw_palette("primary")
```

**Colors:** 
- <span style="display:inline-block;width:20px;height:20px;background-color:#39275B;border:1px solid #ccc;vertical-align:middle;"></span> `#39275B` - UW Purple (primary brand color)
- <span style="display:inline-block;width:20px;height:20px;background-color:#DFDDE8;border:1px solid #ccc;vertical-align:middle;"></span> `#DFDDE8` - Light Purple (complementary)

<table>
<tr>
<td style="background-color:#39275B;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#39275B</td>
<td style="background-color:#DFDDE8;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#DFDDE8</td>
</tr>
</table>

### Secondary Palette
Extended colors for supporting design elements and data visualization.

```r
uw_palette("secondary")
```

**Colors:**
- <span style="display:inline-block;width:20px;height:20px;background-color:#C79900;border:1px solid #ccc;vertical-align:middle;"></span> `#C79900` - Gold
- <span style="display:inline-block;width:20px;height:20px;background-color:#D7C896;border:1px solid #ccc;vertical-align:middle;"></span> `#D7C896` - Light Gold  
- <span style="display:inline-block;width:20px;height:20px;background-color:#8E632A;border:1px solid #ccc;vertical-align:middle;"></span> `#8E632A` - Bronze
- <span style="display:inline-block;width:20px;height:20px;background-color:#000000;border:1px solid #ccc;vertical-align:middle;"></span> `#000000` - Black
- <span style="display:inline-block;width:20px;height:20px;background-color:#FFFFFF;border:1px solid #ccc;vertical-align:middle;"></span> `#FFFFFF` - White
- <span style="display:inline-block;width:20px;height:20px;background-color:#5D5D5D;border:1px solid #ccc;vertical-align:middle;"></span> `#5D5D5D` - Dark Gray

<table>
<tr>
<td style="background-color:#C79900;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#C79900</td>
<td style="background-color:#D7C896;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#D7C896</td>
<td style="background-color:#8E632A;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#8E632A</td>
<td style="background-color:#000000;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#000000</td>
<td style="background-color:#FFFFFF;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#FFFFFF</td>
<td style="background-color:#5D5D5D;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#5D5D5D</td>
</tr>
</table>

### Accent Palette
Vibrant colors for highlighting and accent elements.

```r
uw_palette("accent")
```

**Colors:**
- <span style="display:inline-block;width:20px;height:20px;background-color:#EBB700;border:1px solid #ccc;vertical-align:middle;"></span> `#EBB700` - Bright Gold
- <span style="display:inline-block;width:20px;height:20px;background-color:#5B8F22;border:1px solid #ccc;vertical-align:middle;"></span> `#5B8F22` - Forest Green
- <span style="display:inline-block;width:20px;height:20px;background-color:#0046AD;border:1px solid #ccc;vertical-align:middle;"></span> `#0046AD` - Royal Blue
- <span style="display:inline-block;width:20px;height:20px;background-color:#63B1E5;border:1px solid #ccc;vertical-align:middle;"></span> `#63B1E5` - Sky Blue
- <span style="display:inline-block;width:20px;height:20px;background-color:#EDE8C4;border:1px solid #ccc;vertical-align:middle;"></span> `#EDE8C4` - Cream
- <span style="display:inline-block;width:20px;height:20px;background-color:#C75B12;border:1px solid #ccc;vertical-align:middle;"></span> `#C75B12` - Orange

<table>
<tr>
<td style="background-color:#EBB700;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#EBB700</td>
<td style="background-color:#5B8F22;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#5B8F22</td>
<td style="background-color:#0046AD;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#0046AD</td>
<td style="background-color:#63B1E5;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#63B1E5</td>
<td style="background-color:#EDE8C4;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#EDE8C4</td>
<td style="background-color:#C75B12;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#C75B12</td>
</tr>
</table>

### Muted Palette
Subdued tones perfect for backgrounds and subtle design elements.

```r
uw_palette("muted")
```

**Colors:**
- <span style="display:inline-block;width:20px;height:20px;background-color:#C79900;border:1px solid #ccc;vertical-align:middle;"></span> `#C79900` - Muted Gold
- <span style="display:inline-block;width:20px;height:20px;background-color:#898F4B;border:1px solid #ccc;vertical-align:middle;"></span> `#898F4B` - Olive Green
- <span style="display:inline-block;width:20px;height:20px;background-color:#165788;border:1px solid #ccc;vertical-align:middle;"></span> `#165788` - Navy Blue
- <span style="display:inline-block;width:20px;height:20px;background-color:#93B1CC;border:1px solid #ccc;vertical-align:middle;"></span> `#93B1CC` - Dusty Blue
- <span style="display:inline-block;width:20px;height:20px;background-color:#DBCEAC;border:1px solid #ccc;vertical-align:middle;"></span> `#DBCEAC` - Beige
- <span style="display:inline-block;width:20px;height:20px;background-color:#BD4F19;border:1px solid #ccc;vertical-align:middle;"></span> `#BD4F19` - Rust

<table>
<tr>
<td style="background-color:#C79900;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#C79900</td>
<td style="background-color:#898F4B;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#898F4B</td>
<td style="background-color:#165788;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#165788</td>
<td style="background-color:#93B1CC;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#93B1CC</td>
<td style="background-color:#DBCEAC;width:80px;height:40px;text-align:center;vertical-align:middle;color:black;font-weight:bold;border:1px solid #ddd;">#DBCEAC</td>
<td style="background-color:#BD4F19;width:80px;height:40px;text-align:center;vertical-align:middle;color:white;font-weight:bold;border:1px solid #ddd;">#BD4F19</td>
</tr>
</table>

## Usage Examples

### Basic Usage

```r
library(UWPalette)

# Get all colors from a palette
all_primary <- uw_palette("primary")
all_secondary <- uw_palette("secondary")
all_accent <- uw_palette("accent")
all_muted <- uw_palette("muted")

# Get specific number of colors
three_colors <- uw_palette("accent", 3)
five_colors <- uw_palette("secondary", 5)
```

### Data Visualization with ggplot2

```r
library(ggplot2)
library(UWPalette)

# Create sample data
data <- data.frame(
    category = letters[1:6],
    values = c(23, 45, 56, 78, 32, 12)
)

# Bar plot with UW accent colors
ggplot(data, aes(x = category, y = values, fill = category)) +
    geom_bar(stat = "identity") +
    scale_fill_manual(values = uw_palette("accent")) +
    theme_minimal() +
    labs(title = "Sample Bar Chart with UW Accent Palette",
         subtitle = "Demonstrating UWPalette integration with ggplot2")

# Scatter plot with UW secondary colors
mtcars$cyl_factor <- factor(mtcars$cyl)
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl_factor)) +
    geom_point(size = 3) +
    scale_color_manual(values = uw_palette("secondary", 3)) +
    theme_minimal() +
    labs(title = "MPG vs Weight by Cylinder Count",
         subtitle = "Using UW Secondary Palette",
         color = "Cylinders")
```

### Base R Graphics

```r
# Pie chart with muted palette
pie_data <- c(30, 25, 20, 15, 10)
pie_labels <- c("Category A", "Category B", "Category C", "Category D", "Category E")

pie(pie_data, 
    labels = pie_labels,
    col = uw_palette("muted", 5),
    main = "Sample Pie Chart with UW Muted Palette")

# Barplot with accent colors
barplot(1:6, 
        col = uw_palette("accent"),
        names.arg = paste("Item", 1:6),
        main = "Sample Barplot with UW Accent Palette",
        ylab = "Values")
```

### Heatmaps and Complex Visualizations

```r
library(RColorBrewer)

# Create sample matrix data
set.seed(123)
matrix_data <- matrix(rnorm(100), nrow = 10)

# Heatmap using UW colors
heatmap(matrix_data,
        col = colorRampPalette(uw_palette("primary"))(50),
        main = "Heatmap with UW Primary Palette Gradient")

# Complex visualization combining multiple palettes
library(corrplot)
cor_matrix <- cor(mtcars[, 1:7])
corrplot(cor_matrix, 
         method = "color",
         col = colorRampPalette(c(uw_palette("muted", 1), 
                                  uw_palette("primary", 1)))(200),
         title = "Correlation Matrix with UW Colors")
```

## API Reference

### Functions

#### `uw_palette(name, n)`

Retrieves colors from specified UW palette.

**Parameters:**
- `name` (character): Name of the palette. Options: "primary", "secondary", "accent", "muted". Default: "primary"
- `n` (integer, optional): Number of colors to return. If not specified, returns all colors in the palette.

**Returns:**
- Character vector of hex color codes

**Examples:**
```r
# Get all primary colors
uw_palette("primary")

# Get first 3 secondary colors  
uw_palette("secondary", 3)

# Get 2 accent colors
uw_palette("accent", 2)
```

### Data Objects

#### `uw_palettes`

A named list containing all available color palettes. Each palette is a character vector of hex color codes.

**Structure:**
```r
uw_palettes <- list(
  "primary" = c("#39275B", "#DFDDE8"),
  "secondary" = c("#C79900", "#D7C896", "#8E632A", "#000000", "#FFFFFF", "#5D5D5D"),
  "accent" = c("#EBB700", "#5B8F22", "#0046AD", "#63B1E5", "#EDE8C4", "#C75B12"),
  "muted" = c("#C79900", "#898F4B", "#165788", "#93B1CC", "#DBCEAC", "#BD4F19")
)
```

## Color Accessibility

All colors in the UWPalette package follow University of Washington brand guidelines and have been selected for:

- **Brand Consistency**: Official UW colors as specified in brand guidelines
- **Visual Hierarchy**: Clear distinction between primary, secondary, accent, and muted color roles
- **Print Compatibility**: Colors that work well in both digital and print media
- **Professional Appearance**: Suitable for academic and professional presentations

### Accessibility Considerations

When using these colors, consider:

- **Contrast Ratios**: Ensure sufficient contrast between text and background colors
- **Color Blindness**: Test visualizations with color blindness simulators
- **Grayscale Conversion**: Verify that meaning is preserved when printed in grayscale

## Integration with Other Packages

### ggplot2 Scale Functions

Create custom ggplot2 scales using UW palettes:

```r
# Custom discrete color scale
scale_color_uw <- function(palette = "primary", ...) {
    discrete_scale("colour", "uw", 
                   function(n) uw_palette(palette, n), ...)
}

# Custom discrete fill scale  
scale_fill_uw <- function(palette = "primary", ...) {
    discrete_scale("fill", "uw", 
                   function(n) uw_palette(palette, n), ...)
}

# Usage
ggplot(data, aes(x = x, y = y, color = group)) +
    geom_point() +
    scale_color_uw("accent")
```

### RColorBrewer Integration

```r
# Create gradients using UW colors
uw_gradient <- colorRampPalette(uw_palette("primary"))
colors_50 <- uw_gradient(50)  # 50-color gradient

# Use with heatmaps
heatmap(matrix_data, col = colors_50)
```

## Contributing

We welcome contributions to UWPalette! Please feel free to:

- Report bugs or request features via GitHub issues
- Submit pull requests for improvements
- Suggest additional color palettes or utilities

### Development Setup

```r
# Clone the repository
git clone https://github.com/your-username/UWPalette.git

# Install development dependencies
devtools::install_dev_deps()

# Run tests
devtools::test()

# Build documentation
devtools::document()
```

## License

This package is licensed under the MIT License. See [LICENSE](LICENSE) file for details.

## Acknowledgments

- University of Washington External Affairs for the official color palette guidelines
- R Core Team for the R statistical computing environment
- Package development inspired by RColorBrewer and other color palette packages

## References

- [University of Washington Web Color Palette Guidelines](https://www.washington.edu/externalaffairs/uwmarketing/toolkits/docs/bg/WebColorPalette.pdf)
- [UW Brand Guidelines](https://www.washington.edu/brand/)
- [R Packages Book](https://r-pkgs.org/) by Hadley Wickham and Jenny Bryan

---

**Maintainer:** Joel Rosiene, MD (jrosiene@uw.edu)  
**Version:** 0.1.0  
**Last Updated:** 2024