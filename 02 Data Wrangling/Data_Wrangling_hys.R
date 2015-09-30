require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Infectious_Diseases where COUNT < 15 and SEX NOT IN (\'Total\') and COUNTY= \'San Francisco\'"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_hys82', PASS='orcl_hys82', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

require(extrafont)
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  facet_wrap(~DISEASE) +
  #facet_grid(.~DISEASE, labeller=label_both) + # Same as facet_wrap but with a label.
  #facet_grid(COUNTY~DISEASE, labeller=label_both) +
  labs(title='Infectious Disease in San Fran') +
  labs(x="Year", y=paste("Count")) +
  layer(data=df, 
        mapping=aes(x=as.numeric(as.character(YEAR)), y=as.numeric(as.character(COUNT)), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )

