library(ggplot2)
setwd('~/Downloads')
Kidney = c(0.0232,0.0187,0.0212)
Muscle = c(0.1012,0.0629,0.088)
Breast = c(0.1672,0.1593,0.1216)
Heart = c(0.3121,0.3511,0.409)
Pancreas = c(0.2285,0.2238,0.2449)
Spleen = c(0.1083,0.0872,0.0587)
Liver = c(0.4263,0.4414,0.3563)
Testis = c(0.0761,0.1127,0.1137)
Ovary = c(0.1312,0.1041,0.1596)
Brain = c(0.0798,0.0464,0.0411)


group = c('Kidney','Muscle','Breast','Heart','Pancreas','Spleen','Liver','Testis','Ovary','Brain')
relative = c(mean(Kidney),mean(Muscle),mean(Breast),mean(Heart),mean(Pancreas),mean(Spleen),mean(Liver),mean(Testis),mean(Ovary),mean(Brain))
se = c(sd(Kidney),sd(Muscle),sd(Breast),sd(Heart),sd(Pancreas),sd(Spleen),sd(Liver),sd(Testis),sd(Ovary),sd(Brain))
sheet3 = data.frame(group,relative,se)

ggplot(sheet3,aes(x=factor(group),y=relative))+geom_bar(stat='identity',width=0.6,fill='grey',colour='black')+xlab('')+ylab('Relative expression')+theme_light()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title.y=element_text(size=12),panel.border=element_blank(),axis.line=element_line(colour='grey',size=0.5))+geom_errorbar(aes(ymin=relative-se,ymax=relative+se),width=0.1,color='black',size=0.35)


