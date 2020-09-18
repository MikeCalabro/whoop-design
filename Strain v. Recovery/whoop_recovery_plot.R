# Whoop Re-make Strain Vs Recovery

# Tidyverse contains a variety of useful packages for data manipulation and viz
library(tidyverse) 

# Re-creating the data used in WHOOP's most recent instagram plot post
# Strain_loc denotes the Y-value of the strain on my plot
#   This is a hack, but R dows not allow for 2 seperate scales on plots
date <- (7:14)
strain_loc <- c(.62, .97, .96, .97, .98, .97, .93, .65)
strain <- c(13.7, 20.2, 19.5, 20.6, 20.7, 20.6, 19.2, 14.1)
recovery <- c(.54, .90, .74, .68, .73, .43, .62, .74)

# ggplot requires data to be in a dataframe, so tibble helps combine these lists as such
data <- tibble(date) %>%
          cbind(tibble(strain_loc)) %>%
          cbind(tibble(strain)) %>%
          cbind(tibble(recovery))


# Now we craft the plot!
data %>%
  ggplot() +
  
  # Creates the blue shading between the plotted lines
  geom_ribbon(aes(x = date,
                  ymax = strain_loc,
                  ymin = recovery),
              color = "royalblue1",
              fill = "royalblue1",
              alpha = 0.08) +
  
  # Makes the line connecting the recovery points gray instead of blue
  geom_line(aes(x = date,
                y = recovery),
            color = "gray30") +
  
  # Defines the recovery points
  geom_point(aes(x = date,
                 y = recovery,
                 color = case_when(
                   recovery < .34 ~ "red",
                   recovery < .67 ~ "yellow",
                   recovery > .66 ~ "green"
                 )),
             shape = 21, size = 4, stroke = 2, fill = "black") +
  
  # Coloring these points appropriately
  scale_color_manual(values = c("green", "yellow")) +
  
  # Defines the strain points
  geom_point(aes(x = date,
                 y = strain_loc),
             shape = 21, size = 4, stroke = 2, fill = "black", color = "royalblue1") +
  
  # Defines the labels for all but the last recovery point
  # Last point not included because its label needs to be above the point
  # These ones are below the point
  geom_text(data = data[1:7,], aes( x = date,
                 y = recovery - 0.07,
                 label = glue::glue("{recovery*100}%"),
                 fontface = "bold",
                 color = case_when(
                   recovery < .34 ~ "red",
                   recovery < .67 ~ "yellow",
                   recovery > .66 ~ "green"
                 ))) +
  
  # Defines the labels for all but the last strain point
  # For similar reasons as recovery point
  geom_text(data = data[1:7,], aes(x = date - 0.04,
                y = strain_loc + 0.07,
                label = strain,
                fontface = "bold"),
            color = "royalblue1") +
  
  # Label for final recovery point
  geom_text(data = data[8,],
            aes(x = date,
                y = recovery + 0.07,
                label = glue::glue("{recovery*100}%"),
                fontface = "bold"),
            color = "green") +
  
  # Label for final strain point
  geom_text(data = data[8,],
            aes(x = date - 0.04,
                y = strain_loc - 0.07,
                label = strain,
                fontface = "bold"),
            color = "royalblue1") +
  
  # Each segment defines an individual piece of a y-xis line
  # I could have done this more programatically, but for now it works
  geom_segment(aes(x = 14.5, y = 0, xend = 14.5, yend = .32), color = "red") +
  geom_segment(aes(x = 14.5, y = .34, xend = 14.5, yend = .65), color = "yellow") +
  geom_segment(aes(x = 14.5, y = .67, xend = 14.5, yend = .99), color = "green") +
  geom_segment(aes(x = 6, y = 0, xend = 6, yend = .15), color = "royalblue1") +
  geom_segment(aes(x = 6, y = .17, xend = 6, yend = .32), color = "royalblue1") +
  geom_segment(aes(x = 6, y = .34, xend = 6, yend = .485), color = "royalblue1") +
  geom_segment(aes(x = 6, y = .5, xend = 6, yend = .65), color = "royalblue1") +
  geom_segment(aes(x = 6, y = .67, xend = 6, yend = .82), color = "royalblue1") +
  geom_segment(aes(x = 6, y = .84, xend = 6, yend = .985), color = "royalblue1") +
  
  # Each text label defines a point on a y-axis
  geom_text(aes(x = 15, y = 0, label = "0%"), color = "red") +
  geom_text(aes(x = 15, y = .33, label = "33%"), color = "red") +
  geom_text(aes(x = 15, y = .66, label = "66%"), color = "yellow") +
  geom_text(aes(x = 15, y = 1, label = "100%"), color = "green") +
  geom_text(aes(x = 6.35, y = 0, label = "0"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 1/6, label = "6"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 2/6, label = "10"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 3/6, label = "12"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 4/6, label = "14"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 5/6, label = "16"), color = "royalblue1") +
  geom_text(aes(x = 6.35, y = 6/6, label = "21"), color = "royalblue1") +
  
  # Formatting to replicate the WHOOP graphic style
  theme_classic() +
  theme(legend.position = "none",
        axis.line.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "black", color = "black"),
        plot.background = element_rect(fill = "black", color = "black"),
        panel.grid.minor.y = element_line(size = 0.015),
        panel.grid.major.y = element_line(size = 0.015),
        axis.text.y = element_blank(),
        axis.text.x = element_text(color = "white",
                                   size = 11,
                                   vjust = -1,
                                   family = "sans",
                                   face = "bold"),
        plot.title = element_text(color = "white",
                                  family = "sans",
                                  face = "bold",
                                  hjust = 0.5),
        plot.subtitle = element_text(color = "white",
                                  family = "sans",
                                  face = "bold",
                                  hjust = 0.5)) +
  
  # Defining the view of the plot (plot size/shape)
  scale_y_continuous(limits = c(-.1, 1.1),
                     position = "right") +
  scale_x_continuous(breaks = (7:14),
                     labels = c("Mon\n 7",
                                "Tues\n 8",
                                "Wed\n 9",
                                "Thu\n 10",
                                "Fri\n 11",
                                "Sat\n 12",
                                "Sun\n 13",
                                "Mon\n 14")) +
  coord_cartesian(xlim = c(4.5, 16), expand = FALSE) +
  
  # And finally adding the title and subtitle
  labs(title = "TEAM EF - STRAIN V. RECOVERY",
       subtitle = "WEEK 2")







