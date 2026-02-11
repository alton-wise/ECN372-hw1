suppressPackageStartupMessages({
  library(gapminder)
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  library(scales)
})

dir.create("output", showWarnings = FALSE, recursive = TRUE)

gm <- gapminder

w_mean <- function(x, w) {
  sum(x * w, na.rm = TRUE) / sum(w, na.rm = TRUE)
}

# =========================================================
# FIGURE 1: Bubble trends (2007)
# =========================================================
gm_2007 <- gm %>% filter(year == 2007)

p1 <- ggplot(gm_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(size = pop, color = continent), alpha = 0.65) +
  geom_smooth(aes(group = continent, color = continent),
              method = "lm", se = FALSE, linewidth = 0.8) +
  geom_smooth(aes(group = 1),
              method = "lm", se = FALSE, color = "black", linewidth = 1.0) +
  scale_x_log10(labels = dollar_format(prefix = "$")) +
  scale_size_area(max_size = 18, labels = comma) +
  labs(
    title = "GDP per capita vs Life Expectancy (2007)",
    subtitle = "Bubble size = population; lines = overall + within continent",
    x = "GDP per capita (log scale)",
    y = "Life expectancy (years)",
    size = "Population",
    color = "Continent"
  ) +
  theme_minimal(base_size = 12)

ggsave("output/figure-1-bubble-trends.pdf", p1, width = 9, height = 6)

# =========================================================
# FIGURE 2: Ribbon IQR + median + pop-weighted mean
# =========================================================
summ_cont_year <- gm %>%
  group_by(continent, year) %>%
  summarise(
    q25 = quantile(lifeExp, 0.25, na.rm = TRUE),
    q75 = quantile(lifeExp, 0.75, na.rm = TRUE),
    med = median(lifeExp, na.rm = TRUE),
    wmean = w_mean(lifeExp, pop),
    .groups = "drop"
  )

p2 <- ggplot(summ_cont_year, aes(x = year)) +
  geom_ribbon(aes(ymin = q25, ymax = q75, fill = continent), alpha = 0.20) +
  geom_line(aes(y = med), linewidth = 1.0) +
  geom_line(aes(y = wmean), linewidth = 1.0, linetype = "dashed") +
  facet_wrap(~ continent, ncol = 2) +
  labs(
    title = "Life Expectancy Over Time by Continent",
    subtitle = "Ribbon = IQR (25–75%); solid = median; dashed = pop-weighted mean",
    x = "Year",
    y = "Life expectancy (years)" ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none")

ggsave("output/figure-2-ribbon-median-weighted.pdf", p2, width = 10, height = 7)

message("Done! Figures saved to output/")
