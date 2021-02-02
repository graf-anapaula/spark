# Creamos dos tablas de diferente tamaño
library(tidyverse)
# El objetivo es correr con sparklyr un inner joint y medir a qué velocidad trabaja
data.table::fwrite(tibble(x = rnorm(10e3), y = sin(x)), "data/raw/file1.txt")
data.table::fwrite(tibble(x = rnorm(10e3), y = sin(x)), "data/raw/file2.txt")

# largefile1 pesa 5.3 GB
data.table::fwrite(tibble(x = rnorm(15e7), y = sin(x)), "data/raw/largefile1.txt")
data.table::fwrite(tibble(x = rnorm(10e7), y = sin(x)), "data/raw/largefile2.txt")

