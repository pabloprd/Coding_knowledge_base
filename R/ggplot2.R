library(ggplot2)

#EXAMPLES OF EVERY VARIABLE THAT YOU CAN CONTROL FOR IN GGPLOT2. THERE ARE EVEN MORE:

ggplot(mpg, aes(x = displ, y = hwy, color = class, shape = drv, size = cyl)) +
  geom_point(alpha = 0.7, stroke = 1.5) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "black") +
  facet_wrap(~ manufacturer) +
  labs(
    title = "Engine Displacement vs. Highway MPG",
    subtitle = "Grouped by Vehicle Class, Drive, and Manufacturer",
    caption = "Source: mpg dataset",
    x = "Displacement (L)",
    y = "Highway MPG",
    color = "Vehicle Class",
    shape = "Drive Type",
    size = "Cylinders"
  ) +
  scale_color_viridis_d() + #Annotate this
  scale_shape_manual(values = c(16, 17, 15)) +
  scale_size_continuous(range = c(2, 6)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(size = 22, face = "bold", color = "navy"),
    plot.subtitle = element_text(size = 16, face = "italic"),
    axis.title.x = element_text(size = 15, color = "black"),
    axis.title.y = element_text(size = 15, color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(size = 15, face = "bold"),
    legend.text = element_text(size = 13),
    legend.key.size = unit(1.5, "cm"),
    legend.position = "bottom",
    legend.direction = "horizontal",
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "white"),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 1)
  ) +  coord_cartesian(xlim = c(1, 7), ylim = c(10, 45)) +
  annotate("text", x = 6, y = 40, label = "High Displacement", color = "red", size = 5, fontface = "bold")


'
Geoms: visual represntation of data points on a plot
________________________________________________________
geom_point()
geom_line()
geom_bar()
geom_col()
geom_boxplot()
geom_violin()
geom_histogram()
geom_density()
geom_smooth()
geom_text()
geom_label()
geom_tile()
geom_ribbon()
geom_area()
geom_errorbar()
geom_segment()
geom_abline()
geom_hline()
geom_vline()
geom_rect()
geom_polygon()

Scales: breaks, limits, labels, transformations
__________________________________________________________________
scale_x_continuous(), scale_y_continuous()
scale_x_discrete(), scale_y_discrete()
scale_color_manual(), scale_fill_manual()
scale_color_brewer(), scale_fill_brewer()
scale_color_viridis_d(), scale_fill_viridis_c()
scale_size_continuous(), scale_shape_manual()
scale_x_log10(), scale_y_log10()
scale_x_reverse(), scale_y_reverse()
scale_x_date(), scale_y_date()
scale_alpha_continuous()

Facetting: Control of scales, spacing, strip position, labeller
_____________________________________________________________________
facet_wrap(~ var)
facet_grid(row ~ col)

Themes:
_____________________________________________________________
plot.title
plot.subtitle
plot.caption
plot.tag

Axis Titles and Text
_______________________________________________________________
axis.title.x, axis.title.y
axis.text.x, axis.text.y
axis.ticks.x, axis.ticks.y
axis.line.x, axis.line.y


Legend:
_______________________________________________________________
legend.position
legend.direction
legend.title
legend.text
legend.background
legend.key
legend.key.size
legend.spacing
legend.justification
legend.box
legend.margin

Strip: 
____________________________________________________________________
strip.background
strip.text
strip.placement

Margins and Spacing:
___________________________________________________________________
plot.margin
panel.spacing
axis.ticks.length

General Text and Font:
____________________________________________________________________
text
element_text() for font size, family, face, color, angle, hjust, vjust

Coordinate Systems:
_______________________________________________________________________
coord_cartesian() (zoom in)
coord_flip() (swap x and y)
coord_polar() (polar coordinates)
coord_fixed() (fixed aspect ratio)

Annotations:
______________________________________________________________________
annotate("text", ...)
annotate("rect", ...)
geom_text(), geom_label()
geom_vline(), geom_hline(), geom_abline()

Guides:
guides() to control legend appearance for each aesthetic (e.g., color bar, size legend)

Saving/Exporting:
ggsave() for output size, resolution, device, background

'
