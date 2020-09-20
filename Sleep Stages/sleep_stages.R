# Sleep Time By Stage
library(tidyverse)
library(lubridate)

stages <- c("AWAKE", "LIGHT", "REM", "SWS (DEEP)")
total_minutes <- c(47, 224, 111, 87)

data <- data_frame(stages, total_minutes)

plot_data <- data %>%
  mutate(hours = floor(total_minutes/60)) %>%
  mutate(minutes = total_minutes %% 60) %>%
  mutate(percent = 100*total_minutes/sum(total_minutes))

plot_data %>%
  ggplot() +
  geom_bar(aes(x=0, y=percent, fill=stages), 
           width = 1,
           stat = "identity",
           position = position_fill()) +
  coord_polar(theta = "y") +
  xlim(c(-5, 1)) +
  theme_void() +
  scale_fill_manual(values = c("gray70", "lightblue2", "#001e33", "steelblue"))
