library(ggplot2)
setwd('~/Downloads')
control = c(1.0792,0.8526,0.9526)
rapamycin = c(0.0208,0.0221,0.0186)
group = c('control','rapamycin')
relative = c(mean(control),mean(rapamycin))
se = c(sd(control),sd(rapamycin))
sheet2 = data.frame(group,relative,se)

p = ggplot(sheet2,aes(x=factor(group),y=relative))+geom_bar(stat='identity',width=0.4,fill='grey',colour='black')+xlab('')+ylab('Relative expression')+theme_light()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title.y=element_text(size=10),panel.border=element_blank(),axis.line=element_line(colour='grey',size=0.5))+geom_errorbar(aes(ymin=relative-se,ymax=relative+se),width=0.1,color='black',size=0.35)

p+annotate('text',x='rapamycin',y=0.03,label='*',size=6,col='black')

rel = c(1.0792,0.8526,0.9526,0.0208,0.0221,0.0186)
group = factor(rep(c('control','rapamycin'),each=3))
dt = data.frame(rel,group)
t.test(rel~group,data=dt)
wilcox.test(rel~group,data=dt)

# normality test
shapiro.test(control)
shapiro.test(rapamycin)

