# Librerías ====
library(sparklyr)
library(tidyverse)

# Start Spark ====
spark_install()
# Ahorita lo estoy corriendo localmente pero después lo conectaré al cluster
sc <- spark_connect(master = "local") 
# Abrir la web page de Spark
spark_web(sc) 

diamonds_sdf <- copy_to(sc, diamonds)
diamonds_sdf %>% 
  select(cut, color, clarity) %>% 
  filter(cut == 'Good') %>% 
  show_query()
