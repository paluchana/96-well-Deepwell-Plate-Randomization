# Randomization of 96-well Deepwell Plates

## Overview

This repository contains R code and data for evaluating acetogenic strains through high-throughput screening. The focus is on analyzing growth and product profiles on readily available biomass using 96-well plates. The methodology involves randomization of sample positions across temperature zones to ensure diverse experimental conditions.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Data](#data)
- [Results](#results)
- [Contributing](#contributing)

## Installation

To use the scripts in this repository, ensure you have R installed along with the required packages. You can install the necessary packages using the following command:

```R
# Install required packages
install.packages("ggplot2")   # For data visualization
install.packages("ggplate")    # For plate plotting
```
## Usage
Clone this repository to your local machine:
```R
# Copy code
git clone https://github.com/paluchana/96-well-Deepwell-Plate-Randomization.git
cd acetogenic-strains-evaluation

# Open the R script in RStudio or your preferred R environment.

# Run the following R code to generate the plots:

# Load necessary libraries
library(ggplate)

# Define function for letters
myLetters <- function(length.out) {
  a <- rep(LETTERS, length.out = length.out)
  grp <- cumsum(a == "A")
  vapply(seq_along(a), 
         function(x) paste(rep(a[x], grp[x]), collapse = ""),
         character(1L))
}
```
## Data
```R
# Continue using the provided R code with your provided data

Follow the comments in the R script to understand how to analyze your data and visualize results.

# Adjust Parameters

Modify parameters such as random_seed_sfxx and random_seed_sfyy to set different seeds for randomization, ensuring diverse experimental conditions for your plates.
```

## Results
```R
Check the output plots generated in your working directory. These visualizations provide insights into the growth and metabolic activity of the acetogenic strains.
```
## Contributing
```R
Contributions to this repository are welcome! If you have suggestions for improvements or would like to add features, please fork the repository and submit a pull request. You can also open issues for any bugs or enhancements.
```
