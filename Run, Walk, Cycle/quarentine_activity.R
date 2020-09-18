# Run/Walk/Cycle Quarentine plot

library(tidyverse)
library(gganimate)
library(gifski)
library(png)
library(lubridate)
library(xts)

date <- seq(as.Date("2020-01-01"), as.Date("2020-05-17"), by="days")
run <- seq(-25, 25, length.out = length(date))
walk <- seq(-40, 40, length.out = length(date))
cycle <- seq(-15, 32, length.out = length(date))

RUNNING <- xts(x = run, order.by = date)
WALKING <- xts(x = walk, order.by = date)
CYCLING <- xts(x = cycle, order.by = date)

ts_b <- merge(RUNNING, CYCLING)
ts_full <- merge(ts_b, WALKING)

autoplot(ts_full, facets = FALSE) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "white") +
  geom_vline(xintercept = as.Date("2020-04-20"), size = 150, alpha = 0.15, color = "royalblue1") +
  geom_label(aes(x = as.Date("2020-02-04"), y = 85, label = "PRE QUARENTINE"), color = "#14181b") +
  geom_label(aes(x = as.Date("2020-04-18"), y = 85, label = "DURING QUARENTINE"), color = "#14181b") +
  scale_x_date(date_labels = "%m-%d", date_breaks = "2 weeks") +
  scale_y_continuous(limits = c(-100, 100), breaks = seq(-100, 100, by = 25)) +
  scale_color_manual(values = c("purple", "green", "orange")) +
  theme_classic() +
  theme(axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_text(color = "white"),
        axis.line = element_line(color = "white"),
        axis.text = element_text(color = "white"),
        panel.background = element_rect(fill = "#14181b", color = "#14181b"),
        plot.background = element_rect(fill = "#14181b", color = "#14181b"),
        strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.background = element_rect(fill = "#14181b", color = "#14181b"),
        legend.text = element_text(color = "white", size = 11),
        legend.key.size = unit(2, "cm"),
        legend.spacing.x = unit(0.3, "cm")) +
  labs(y = "PERCENT CHANGE FROM AVERAGE")


  