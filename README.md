# Computer Simulation Course Projects
### Amirkabir University of Technology (Tehran Polytechnic)

This repository contains the implementation of projects for the Computer Simulation course, supervised by Dr. Amir Hossein Ghatari. The projects focus on statistical modeling, financial time series forecasting, meteorological data analysis, and stochastic simulation techniques using the R programming language.

## Projects Overview

### [Project 01: Data Analysis and Statistical Modeling](./Project01)
This project is divided into two main parts focusing on real-world data application:

* **Part 1: Financial Time Series Analysis:** Investigation of gold investment funds (e.g., Lotus Gold Fund) using historical data. It includes stationarity testing (ADF test), seasonality analysis, and future price forecasting using ARIMA models.
* **Part 2: Meteorological Regression Analysis:** Study of the relationship between temperature and precipitation data for Tehran. It implements correlation analysis and linear regression models to understand environmental patterns.

### [Project 02: Stochastic Simulation and Numerical Integration](./Project02)
Focuses on computational methods for estimating complex integrals and simulating random variables:

* **Monte Carlo (MC) Integration:** Estimation of definite integrals using various sample sizes (N) and analyzing the absolute error convergence.
* **Variable Transformation:** Implementing the transformation method to solve integrals over infinite domains.
* **Importance Sampling:** Optimization of simulation efficiency by choosing appropriate weighting distributions (e.g., Gamma distribution) to reduce variance in estimations.

## Technologies Used
- Programming Language: R
- Key Libraries: tseries, forecast, ggplot2, stats

## Repository Structure
The repository is organized as follows:
- **Project01/**: Contains R scripts for financial and weather analysis, datasets (CSV), and generated visualization plots.
- **Project02/**: Contains the main R implementation for Monte Carlo methods and Importance Sampling.
- **Reports/**: Detailed PDF reports for each project explaining the methodology, mathematical proofs, and results analysis.
