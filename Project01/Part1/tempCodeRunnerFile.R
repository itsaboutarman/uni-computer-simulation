# Load required libraries
library(tidyverse)
library(lubridate)
library(tseries)
library(forecast)
library(ggplot2)

# Load CSV file
data <- read.csv("C:\\Users\\sadad\\Desktop\\Question1\\Lotus.Gold.Com.ETF.csv")

# Extract date and closing price columns
data$date <- ymd(data$X.DTYYYYMMDD.)
data$close <- data$X.CLOSE.

# Keep only relevant columns
data <- data[, c("date", "close")]

# Sort by date
data <- data[order(data$date), ]

# Remove missing values
data <- na.omit(data)

# Create time series object
ts_data <- ts(data$close, frequency = 365)

# Plot time series
autoplot(ts_data) +
  ggtitle("Time Series of Closing Prices - Lotus Gold Fund") +
  xlab("Date") + ylab("Closing Price") +
  theme_minimal()

# Augmented Dickey-Fuller test for stationarity
adf.test(ts_data)

# Decomposition for seasonality analysis
decomp <- stl(ts_data, s.window = "periodic")
autoplot(decomp)

# Fit ARIMA model
model <- auto.arima(ts_data)
summary(model)

# Forecast the next 30 days (Farvardin 1404)
forecast_30 <- forecast(model, h = 30)

# Plot the forecast
autoplot(forecast_30) +
  ggtitle("Forecast of Closing Prices for Farvardin 1404") +
  xlab("Date") + ylab("Forecasted Price") +
  theme_minimal()

# Calculate risk metrics: standard deviation and Sharpe ratio
returns <- diff(log(data$close))
sd_return <- sd(returns)
mean_return <- mean(returns)
sharpe_ratio <- (mean_return - 0.0006) / sd_return

# Print risk metrics
print(paste("Standard Deviation of Returns:", round(sd_return, 5)))
print(paste("Sharpe Ratio:", round(sharpe_ratio, 2)))
