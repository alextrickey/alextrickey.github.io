



library(ggplot2)

#Import Data
skill_dates <- read.csv("skill_dates.csv",
                        strip.white = TRUE, 
                        colClasses = c('factor','factor','Date','Date'))
lapply(skill_dates,class)

#Plot Based On: http://stackoverflow.com/questions/9862519
ggplot(skill_dates, aes(colour=skill_type,
                        group=skill_type)) + 
  geom_segment(aes(x=Start, xend=End, 
                   y=Skill, yend=Skill), 
               size=5) +
  xlab("Dates Used") +
  ylab("") +
  ggtitle("Relevant Skills by Dates Used") +
  theme(legend.position="none",
        text = element_text(size=15)) + 
  facet_grid(skill_type~.,
             scales = 'free',
             space='free')
