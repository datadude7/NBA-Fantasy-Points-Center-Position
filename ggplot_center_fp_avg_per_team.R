library(tidyverse)

nba_stats <- read.csv("NBA Fantasy - 1_12_23.csv")

C_stats <- nba_stats %>% 
  group_by(TEAM, Pos) %>% 
  filter(Pos == "C") %>% 
  summarise(mean_FP = mean(FP)) 


C_stats %>% 
  ggplot(aes(TEAM, mean_FP, 
             colour = TEAM))+
  geom_point(size = 4)+
  geom_segment(aes(x = TEAM,
                   y = mean(mean(mean_FP)),
                   xend = TEAM,
                   yend = mean_FP),
               colour = "dark grey")+
  geom_hline(yintercept = mean(C_stats$mean_FP),
             colour = "dark grey")+
  theme(axis.text = element_text(angle = 90))+
  labs(title = "Teams Avg Fantasy Points By Centers",
       y = "Fantasy Points",
       x = "Teams")
