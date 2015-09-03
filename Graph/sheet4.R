
library(ggplot2)
# Import data

sheet4 = read.csv('/Users/Evan/DataScience/Working/Graph/csv/sheet4.csv',header=T)[-c(6,12),1:2]

sheet4$group = factor(rep(c(1:3),each=5))

ggplot(sheet4,aes(x=factor(Inhibition.time),y=Concentration,group=group,linetype=group,shape=group))+geom_line(colour='grey')+geom_point(size=3)+theme_light()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title.y=element_text(size=12),panel.border=element_blank(),axis.line=element_line(colour='grey',size=0.5))+xlab('Inhibition time')
