require(tidyr)
require(dplyr)
require(ggplot2)
require(jsonlite)
require(RCurl)

# Change the USER and PASS below to be your UTEid
df_jnw <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Infectious_Diseases where SEX = \'Female\' or SEX = \'Male\'"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_jnw653', PASS='orcl_jnw653', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

View(df_jnw)

df_jnw %>% select(DISEASE, YEAR, COUNT, SEX) %>% filter(DISEASE == "Gonorrhea" | DISEASE == "Chlamydia" | DISEASE == "HIV") %>% ggplot(aes(x = YEAR, y = COUNT, color = DISEASE)) + geom_point(position = "jitter") + facet_wrap(~SEX) + theme(axis.text.x=element_text(angle=70, size = 10, vjust=0.5))
