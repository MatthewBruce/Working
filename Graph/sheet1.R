library(ggplot2)
library(reshape2)
library(dplyr)
sheet1_1 = read.csv('/Users/Evan/DataScience/Working/Graph/csv/sheet1.csv',header=T)[1:14,1:3][-c(5,7),]
sheet1_2 = read.csv('/Users/Evan/DataScience/Working/Graph/csv/sheet1.csv',header=T)[1:14,1:3][c(5,7),]

names(sheet1_1) = c('Fatty_Acid','Control','Treatment')
names(sheet1_2) = c('Fatty_Acid','Control','Treatment')

sheet1_1$control_mean = substr(sheet1_1$Control,1,5)
sheet1_1$Treatment_mean = substr(sheet1_1$Treatment,1,5)
sheet1_1$control_sd = substr(sheet1_1$Control,7,13)
sheet1_1$Treatment_sd = substr(sheet1_1$Treatment,7,13)
sheet1_1 = sheet1_1[,-c(2,3)]

sheet1_2$control_mean = substr(sheet1_2$Control,1,6)
sheet1_2$Treatment_mean = substr(sheet1_2$Treatment,1,6)
sheet1_2$control_sd = substr(sheet1_2$Control,9,14)
sheet1_2$Treatment_sd = substr(sheet1_2$Treatment,9,14)
sheet1_2 = sheet1_2[,-c(2,3)]

dt = melt(sheet1_1,id=c('Fatty_Acid','control_sd','Treatment_sd'))
dt = melt(dt,id=c('Fatty_Acid','variable','value'))[-c(13:36),-4]
names(dt)[2:4] = c('trial','mean','sd')

dt$mean = as.numeric(dt$mean)
dt$sd = as.numeric(dt$sd)

dt = arrange(dt,Fatty_Acid)

dt$Fatty_Acid=reorder(dt$Fatty_Acid,dt$mean)

p=ggplot(dt,aes(x=Fatty_Acid,y=mean,fill=trial))+geom_bar(position = 'dodge',colour='black',stat="identity")+theme_light()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title.y=element_text(size=10),panel.border=element_blank(),axis.line=element_line(colour='grey',size=0.5))+ylab('Concentration(mg/kg)')+scale_fill_brewer(palette="Pastel1")+guides(fill=guide_legend(reverse=TRUE)) +xlab('Fatty Acid')

p+coord_flip()


