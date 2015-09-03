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
names(dt)[2:4] = c('Group','mean','sd')

dt$mean = as.numeric(dt$mean)
dt$sd = as.numeric(dt$sd)

dt = arrange(dt,Fatty_Acid)

dt$Fatty_Acid=reorder(dt$Fatty_Acid,dt$mean)

p=ggplot(dt,aes(x=Fatty_Acid,y=mean,fill=Group))+geom_bar(position = 'dodge',colour='black',stat="identity")

q=p+theme_light()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title.y=element_text(size=10),panel.border=element_blank(),axis.line=element_line(colour='grey',size=0.5))+ylab('Concentration(mg/kg)')+guides(fill=guide_legend(reverse=TRUE,title=NULL)) +xlab('Fatty Acid')+scale_fill_discrete(labels=c("Control", "Treatment"))++scale_fill_discrete(labels=c("Control", "Treatment"))

r=q+geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd),position=position_dodge(.9),width=0.2,color='black',size=0.35)

r+coord_flip()



