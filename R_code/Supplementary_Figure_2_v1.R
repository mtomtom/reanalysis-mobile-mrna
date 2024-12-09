library(readxl)
library(tidyverse)
library(ggplot2)


data_nicotiana <- read_tsv("nicotiana_blast.tsv", col_names = TRUE) 
View(data_nicotiana)

p<-ggplot(data=data_nicotiana, aes(x=mRNA, y=Count)) +
  geom_bar(stat="identity")+
  theme_minimal()
p

# Horizontal bar plot
p + coord_flip()

blast <- ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=1.6, color="white", size=3.5)+
  theme_minimal()

