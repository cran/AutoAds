\name{plot_trend_and_forecast}
\alias{plot_trend_and_forecast}
\title{
Plot with trend and forecast
}
\description{
Plotting metrics of the dataset with trend and forecast, splitting them by groups of different ad blocks.
}
\usage{
plot_trend_and_forecast(data, x_col, y_col, group_col)
}
\arguments{
  \item{data}{
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Date', 'Block', and at least one with the data needed to plot ('Requests', 'Impressions', 'Revenue', 'Viewable', 'Clicks').
  }
  \item{x_col}{
Column of the dataset 'data' with the data required for the x-axis of the plot. Preferrably 'Date'.
  }
  \item{y_col}{
Column of the dataset 'data' with the data required for the y-axis of the plot. Preferrably the one with the data needed to plot ('Requests', 'Impressions', 'Revenue', 'Viewable', 'Clicks').
  }
  \item{group_col}{
Column of the dataset 'data' with the data required for grouping the data. Preferrably 'Block'.
  }
}

\value{
A plot of the chosen data with trend and forecast.
}
\references{
Hyndman, R. J., & Athanasopoulos, G. (2018). "Forecasting: Principles and Practice" - \url{https://otexts.com/fpp3/}
Documentation for 'forecast' - \url{https://pkg.robjhyndman.com/forecast/}
Documentation for 'ggplot2' - \url{https://ggplot2.tidyverse.org/}
Wickham, H. (2016). "ggplot2: Elegant Graphics for Data Analysis" - \url{https://ggplot2-book.org/}
}
\author{
Ivan Nemtsev
}
\note{
This function also requires packages 'ggplot2', and 'forecast'.
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Date', 'Block', and at least one with the data needed to plot ('Requests', 'Impressions', 'Revenue', 'Viewable', 'Clicks').
}
\examples{\donttest{
## The function is currently defined as
plot_trend_and_forecast <- function(data, x_col, y_col, group_col) {
  data$Date <- as.Date(data$Date)
  data_groups <- split(data, data[[group_col]])
  for (group in names(data_groups)) {
    group_data <- data_groups[[group]]
    time_series <- ts(group_data[[y_col]], frequency = 1, start = min(group_data[[x_col]]))
    arima_model <- auto.arima(time_series)
    forecast <- forecast(arima_model, h = 6)
    forecast_dates <- seq(max(group_data[[x_col]]) + 1,
    to = max(group_data[[x_col]]) + length(forecast$mean),
    by = "day")
    forecast_data <- data.frame(Date = forecast_dates, Forecast = forecast$mean)
    print(ggplot() +
            geom_line(data = group_data, aes(x = !!rlang::sym(x_col), y = !!rlang::sym(y_col))) +
            geom_line(data = forecast_data, aes(x = Date, y = Forecast), color = "blue") +
            geom_ribbon(data = forecast_data, aes(x = Date, ymin = forecast$lower[, 2],
            ymax = forecast$upper[, 2]), fill = "blue", alpha = 0.2) +
            labs(x = x_col, y = y_col, title = group) +
            theme_minimal())
  }
}

## Example of use:
data <- data.frame(
  Date = c("2022-07-01", "2022-07-02", "2022-07-03", "2022-07-29", "2022-07-30", "2022-07-31"),
  Block = c("1_234", "1_234", "1_234", "1_235", "1_235", "1_235"),
  Requests = c(372234, 268816, 291224, 1928854, 1928290, 786539),
  Impressions = c(18537, 12432, 13764, 2839269, 2682648, 1114773),
  Revenue = c(13.5, 9.13, 8.85, 1669.0, 1654.0, 739.0),
  Clicks = c(1167, 720, 856, 214451, 196657, 93178),
  Viewable = c(13320, 8214, 9768, 2446884, 2243865, 1063158)
)
plot_trend_and_forecast(data, "Date", "Impressions", "Block")
#Any value instead of Impressions can be here
  }}

\keyword{ dplot }
\keyword{ hplot }
\keyword{ models }
\keyword{ regression }
\keyword{ ts }
\concept{ plot }
\concept{ trend }
\concept{ forecast }
\concept{ metrics }


