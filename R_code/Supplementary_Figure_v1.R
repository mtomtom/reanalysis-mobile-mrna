library(readxl)
library(tidyverse)
library(ggplot2)


data_rosette <- read_csv("../Data/FN_rosette.table", col_names = TRUE) 

data_rosette <- data_rosette %>% filter(nchar(REF)==1)
data_rosette <- data_rosette %>% filter(str_detect(ALT, ","))

Filtered_data_rosette <- data_rosette %>% select('#CHROM',POS,INFO)
#write_tsv(Filtered_data_rosette,'../Data/FN_rosette.reduced.table_20240911' )

data_REF <- read_tsv("../Data/FN_rosette_REF_ALT_20240918.txt", col_names = TRUE) 
#View(data_REF)
data_arranged <- arrange(data_REF, REF)
data_arranged <- data_arranged %>% filter(ALT>-1 & ALT<400)  %>% mutate(id_rosette = row_number())




data_root <- read_csv("../Data/FN_root.table", col_names = TRUE) 
data_root <- data_root %>% filter(nchar(REF)==1)
data_root <- data_root %>% filter(str_detect(ALT, ","))
Filtered_data_root <- data_root %>% select('#CHROM',POS,INFO)


write_tsv(Filtered_data_root,'../Data/FN_root.reduced.table_20240911' )

data_root_REF <- read_tsv("../Data/FN_root_REF_ALT_20240918.txt", col_names = TRUE) 
data_root_arranged <- arrange(data_root_REF, ALT_root)
data_root_arranged <- data_root_arranged %>% filter(REF_root>-1 & REF_root <400)  %>% mutate(id_root = row_number())
data_root_arranged


merged_data <- merge(data_root_arranged,data_arranged, by="POS")


merged_root <- merged_data %>% mutate(Ratio_root=ALT/ALT_root)
merged_root_rosette <- merged_root %>% mutate(Ratio_rosette=REF_root/REF)

merged_root_rosette <- merged_root_rosette %>% mutate(Expression = case_when(
  ALT_root == 34480 ~ "GRP7",
  ALT_root == 30330 ~ "TCTP1",
  REF > 100000 ~ "TCTP1",
  ALT_root > 5000    ~ "root" ,
  REF > 5000   ~ "rosette" ,
  ALT_root > 5000 & REF > 5000  ~ "both",
  REF > 100000 ~ "TCTP1",
  ALT_root == 30330 ~ "TCTP1",
  .default = "low"))



merged_root_rosette %>% filter(Expression=="TCTP1")

Filtered_merged_root_rosette <- merged_root_rosette %>% filter(REF>0 & ALT_root > 0) %>% filter(POS!="8736845" & POS!="14159195" & 
                                                                                                  POS!="16164452" &  POS!="16271972" &
                                                                                                  POS!="2239551" & POS!="2239581" &
                                                                                                  POS!="29502961")


Filtered_merged_rosette_root <- merged_root_rosette %>% filter(REF >0 & ALT_root > 0) %>%
  filter(POS!="3850417" & POS!="6309639" & 
           POS!="10623793" &  POS!="13550428" &
           POS!="15988371" & POS!="15988383" &
           POS!="3850417" & POS!="6309639" & #)
           POS!="8736845" & POS!="14159195" & 
           POS!="16164452" &  POS!="16271972" &
           POS!="2239551" & POS!="2239581" &
           POS!="29502961" & POS!="13550455" &
           POS!="10318971" & POS!="10318974" & POS!="10318980"&
           POS!="2417676" & POS!="3062491" &
           POS!="8753706" & POS!="8753709" &
           POS!="17610985" & POS!="17610988" &
           POS!="788340" & POS!="2417676" & POS!="3062491" & POS!="7927677" & POS!="7927687" &
           POS!="10722807" & POS!="12609743" & POS!="13552774" & POS!="16395637" & POS!="16395637" &
           POS!="17417057" & POS!="20212820" & POS!="15350838" & POS!="16396277" &
           POS!="22687750" & POS!="22687759" & POS!="10318932")

head(Filtered_merged_rosette_root)
write_tsv(Filtered_merged_rosette_root,'../Bioinformatics/FN_rosette_root_for_Richard_20240918.txt' )




ggplot(Filtered_merged_root_rosette, aes(x=ALT_root, y=ALT)) + 
  geom_point(data = Filtered_merged_root_rosette , aes(x = ALT_root, y=ALT,color=Expression),size=0.1)+
  geom_smooth(method='lm',size=0.1)+
  labs(x="Expression level in root", y="The number Root alleles of Rosette sample")+ # THE X-LABEL
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ # THE BACKGROUND OF THE GRAPH, NO GRID
  theme(axis.line = element_line(colour = "black"))   # DRAWING THE BLACK LINES AROUND THE PLOT

#  coord_fixed(xlim=c(0,50000), ylim=c(0,25))

ggplot(Filtered_merged_rosette_root, aes(x=REF, y=REF_root)) + 
  geom_point(data = Filtered_merged_rosette_root , aes(x = REF, y=REF_root,color=Expression),size=0.2)+
  geom_smooth(method='lm',size=0.1)+
  labs(x="Expression level in rosette", y="The number of Rosette allele of root sample")+ # THE X-LABEL
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ # THE BACKGROUND OF THE GRAPH, NO GRID
  theme(axis.line = element_line(colour = "black"))+   # DRAWING THE BLACK LINES AROUND THE PLOT
  geom_line(data = Filtered_merged_rosette_root , aes(x = REF, y=0.001),linewidth=0.1)

# fit linear model 
linear_model <- lm( REF_root ~ REF, data=Filtered_merged_rosette_root) 
# view summary of linear model 
summary(linear_model)

# fit linear model 
linear_model1 <- lm( ALT ~ ALT_root, data=Filtered_merged_root_rosette) 
# view summary of linear model 
summary(linear_model1)

