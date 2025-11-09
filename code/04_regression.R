# code/04_regression.R

here::i_am("code/04_regression.R")

library(dplyr)
library(broom)
library(ggplot2)
library(here)

run_regression_analysis <- function(data) {
  # Select relevant variables
  model_data <- data %>%
    select(PTS, AST, TRB, `FG%`, `3P%`) %>%
    filter(
      !is.na(PTS),
      !is.na(AST),
      !is.na(TRB),
      !is.na(`FG%`),
      !is.na(`3P%`)
    )
  
  # Linear regression model
  lm_fit <- lm(PTS ~ `FG%` + `3P%` + AST + TRB, data = model_data)
  
  # Summaries
  coef_table <- tidy(lm_fit)
  fit_stats  <- glance(lm_fit)
  
  # Diagnostic plot
  diag_plot <- ggplot(model_data, aes(x = fitted(lm_fit), y = PTS)) +
    geom_point(alpha = 0.6) +
    geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
    labs(
      x = "Predicted Points per 36 Minutes",
      y = "Actual Points per 36 Minutes",
      title = "Predicted vs Actual Points per 36 Minutes"
    )
  
  # Save model for reproducibility
  out_dir <- here::here("output")
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)
  saveRDS(lm_fit, file = file.path(out_dir, "regression.rds"))
  
  list(
    model = lm_fit,
    coef_table = coef_table,
    fit_stats = fit_stats,
    diag_plot = diag_plot
  )
}