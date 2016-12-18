
library(ggplot2)

#Set directory
setwd("~/Documents/GitHubStuff/alextrickey.github.io")

#Import Data
skill_dates <- read.csv("plot_code/skill_dates.csv",
                        strip.white = TRUE, 
                        colClasses = c('factor','factor','Date','Date'),
                        comment.char='#')
lapply(skill_dates,class)

#Plot Based On: http://stackoverflow.com/questions/9862519
ggplot(skill_dates, aes(colour=skill_type,
                        group=skill_type)) + 
  geom_segment(aes(x=Start, xend=End, 
                   y=Skill, yend=Skill), 
               size=5) +
  xlab("Date") +
  ggtitle("Periods of Active Use by Skill (Last 10 Years)") + 
  theme(legend.position="none",
        axis.title.y=element_blank(),
        axis.text= element_text(color = "#ECE2CC"),
        text = element_text(size=15,color = "#ECE2CC"),
        strip.background = element_rect(fill="#A7A7A7"),# hex: #A7A7A7
        strip.text = element_text(color="#1D1D1D"),# hex: #A7A7A7
        plot.background = element_rect(fill = "#1D1D1D")) + 
  facet_grid(skill_type~.,
             scales = 'free',
             space='free')
