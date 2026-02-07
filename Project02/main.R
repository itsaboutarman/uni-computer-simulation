g_transformed <- function(u) {
  exp(-(1 / u - 1)) * cos((1 / u - 1)^2) / (u^2)
}

g_exp <- function(x) {
  cos(x^2)
}

g_is <- function(x) {
  cos(x^2)
}

k <- 1.5
theta <- 1

exact_integral_value <- 0.4963

sample_sizes <- c(100, 500, 1000, 5000)

results_mc <- data.frame(N = sample_sizes, Estimate = NA, AbsError = NA)
results_is <- data.frame(N = sample_sizes, Estimate = NA, AbsError = NA)
results_vt <- data.frame(N = sample_sizes, Estimate = NA, AbsError = NA) 

set.seed(42) 

for (i in seq_along(sample_sizes)) {
  N <- sample_sizes[i]
  x <- rexp(N, rate = 1)
  Ihat <- mean(g_exp(x))
  results_mc$Estimate[i] <- Ihat
  results_mc$AbsError[i] <- abs(Ihat - exact_integral_value)
}

for (i in seq_along(sample_sizes)) {
  N <- sample_sizes[i]
  u_samples <- runif(N, 0, 1) 
  Ihat_vt <- mean(g_transformed(u_samples))
  results_vt$Estimate[i] <- Ihat_vt
  results_vt$AbsError[i] <- abs(Ihat_vt - exact_integral_value)
}

for (i in seq_along(sample_sizes)) {
  N <- sample_sizes[i]
  y <- rgamma(N, shape = k, scale = theta)
  weights <- dexp(y, rate = 1) / dgamma(y, shape = k, scale = theta)
  Ihat <- mean(weights * g_is(y))
  results_is$Estimate[i] <- Ihat
  results_is$AbsError[i] <- abs(Ihat - exact_integral_value)
}

print("Monte Carlo Method:")
print(results_mc)

print("Importance Sampling Method:")
print(results_is)

print("Variable Transformation Method:")
print(results_vt)

library(ggplot2)

results_df_mc <- data.frame(N = sample_sizes, Error = results_mc$AbsError, Method = "Monte Carlo (Exp)")
results_df_is <- data.frame(N = sample_sizes, Error = results_is$AbsError, Method = "Importance Sampling (Gamma)")
results_df_vt <- data.frame(N = sample_sizes, Error = results_vt$AbsError, Method = "Variable Transformation U(0,1)")
all_results_df <- rbind(results_df_mc, results_df_is, results_df_vt)

ggplot(all_results_df, aes(x = N, y = Error, color = Method, group = Method)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = sample_sizes) +
  labs(
    title = "Comparison of Absolute Error in Monte Carlo, Importance Sampling, and Variable Transformation Methods",
    x = "Sample Size (N)", y = "Absolute Error"
  ) +
  theme_minimal()
