library(ggplot2)
library(ggthemes)
library(ggTimeSeries)
library(plotly)
library(scales)

# Set Theme
dash_theme <- function() {
  minimalTheme <- theme_set(theme_bw(12))
  minimalTheme <- theme_update(
    axis.ticks       = element_blank(),
    legend.position  = "none",
    strip.background = element_blank(),
    panel.border     = element_blank(),
    panel.background = element_blank(),
    panel.grid       = element_blank()
  )
}

# Get mockdata
mock_data <- function(x = "bitcoin") {
  url      <- paste0("https://graphs2.coinmarketcap.com/currencies/", x)
  DATA     <- jsonlite::fromJSON(url, flatten = TRUE)$volume_usd
  df       <- tibble::tibble(ts = DATA[, 1], amt = DATA[, 2])
  df$ts    <- as.POSIXlt(as.numeric(df$ts / 1000), origin = "1970-01-01", tz = "UTC")
  df$ts    <- as.Date(df$ts)
  df$count <- as.numeric(df$amt)
  df$amt   <- NULL
  df       <- as.data.frame(df)
}

#' @title Calendar Heatmap
#' @description A calendar heatmap is a great way to visualise daily data. Its structure makes it easy to detect weekly, monthly, or seasonal patterns.
ggplot_calendar_heatmap(anomaly_df, "timestamp", "count", monthBorderSize = 1) +
  xlab(NULL) +
  ylab(NULL) +
  scale_colour_viridis_c(direction = -1) +
  facet_wrap( ~ Year, ncol = 1) +
  dash_theme()

#' @title Box plots with jitter
#' @description A box and whisker displays a five-number summary of data and includes the minimum, first quartile, median, third quartile, and maximum values.
#' .
#' @note The dots are called 'jitter' as so the distribution are not stacked on top of each other misleading the user.
base <- ggplot(df, aes(df[, 1], df[, 2])) +
  stat_boxplot(aes(fill = df[, 1]), alpha = .5) +
  geom_jitter(aes(color = df[, 1]), size = 3, alpha = .2) +
  scale_y_discrete(breaks = seq(0, 1, .1), labels = scales::percent) +
  guides(fill = FALSE, color = FALSE) +
  labs(title = "Title", x = "X-Axis", y = "Y-Axis") +
  coord_flip()
ggplotly(base)
