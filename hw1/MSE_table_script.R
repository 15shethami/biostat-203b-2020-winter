
library(tidyverse)

## Separate files into specific classifications
file_list <- list.files(pattern = "\\<n")
gauss_files <- str_subset(file_list, "gaussian")
t1_files <- str_subset(file_list, "t1")
t5_files <- str_subset(file_list, "t5")
nVals <- seq(100, 500, by = 100)

## Create a function to read in txt files
read <- function(x) {
  read_delim(x, delim = "\n", col_names = F, col_types = cols())
}

## Read in each distribution separately
gauss_list <- NULL
for (file in gauss_files) {
  gauss_list[file] <- read(file)
}

t1_list <- NULL
for (file in t1_files) {
  t1_list[file] <- read(file)
}

t5_list <- NULL
for (file in t1_files) {
  t5_list[file] <- read(file)
}

## Convert lists into individuals elements
Gaussian <- unlist(gauss_list, use.names = F)
t1 <- unlist(t1_list, use.names = F)
t5 <- unlist(t5_list, use.names = F)

## Create table
n <- rep((nVals), each = 2)
Method <- rep(c("PrimeAvg", "SampAvg"), length(gauss_list))
results <- tibble(n, Method, Gaussian, t5, t1)
print(results)
