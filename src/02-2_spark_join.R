# Library ====
library(tidyverse)
library(sparklyr)

# Conexión spark ====
sc <- spark_connect(master = "local")
x <- spark_read_csv(sc, "data/raw/file1.txt", delimiter = ",", memory = FALSE)

# Hay 1000 elementos, mismo número de elementos en la tabla 
x %>% inner_join(x, by = 'x') %>% 
  count()

# Ahora vamos a hacer lo mismo pero con los dos archivos pesados
# Importante: memory = FALSE para no cargar nada en la memoria
x1 <- spark_read_csv(sc, "data/raw/largefile1.txt", memory = F)
x2<- spark_read_csv(sc, "data/raw/largefile2.txt", memory = F)

x1 %>% inner_join(x2, by = 'x') %>% count()




