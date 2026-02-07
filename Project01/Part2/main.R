packages <- c("dplyr", "readr", "lubridate", "ggplot2")
new_packages <- packages[!packages %in% installed.packages()]
if (length(new_packages)) install.packages(new_packages)
lapply(packages, library, character.only = TRUE)

data <- read_csv("C:\\Users\\sadad\\Desktop\\Question2\\Tehran (Mehrabad Airport).csv", show_col_types = FALSE)

data <- data %>%
  rename(Temperature = tm, Rainfall = rain) %>%
  mutate(Date = seq.Date(from = as.Date("2023-01-21"), by = "day", length.out = nrow(data)))

data_bahman <- data %>%
  filter(Date >= as.Date("2023-01-21") & Date <= as.Date("2023-02-19")) %>%
  filter(!is.na(Temperature) & !is.na(Rainfall))

cat("Number of records in Bahman 1401:", nrow(data_bahman), "\n")
print(summary(data_bahman))

cat("\n🔹 Correlation:\n")
correlation <- cor(data_bahman$Temperature, data_bahman$Rainfall)
print(correlation)

cat("\n🔹 Linear Regression Model:\n")
model <- lm(Rainfall ~ Temperature, data = data_bahman)
summary(model)

ggplot(data_bahman, aes(x = Temperature, y = Rainfall)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(
    title = "Relationship Between Temperature and Rainfall in Bahman 1401",
    x = "Average Temperature (°C)", y = "Rainfall (mm)"
  ) +
  theme_minimal()
