require("jsonlite")
require("RCurl")
require("ggplot2")
require("dplyr")

df_A <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Infectious_Diseases where COUNTY NOT IN (\'California\')"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_cmm5627', PASS='orcl_cmm5627', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

require(extrafont)
df_A %>% select(DISEASE, COUNTY, COUNT) %>% filter(DISEASE == "Scombroid Fish Poisoning" & COUNT > 0 | DISEASE == "Paralytic Shellfish Poisoning" & COUNT > 0) %>% ggplot(aes(y = COUNTY, x = COUNT, color = DISEASE)) + ggtitle("Paralytic Shellfish and Scromboid Fish Poisonings in California") + geom_point(position = "jitter") 




