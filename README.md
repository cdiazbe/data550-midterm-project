# Midterm Project: NBA player statistics

## Code Description

### `code/01_summary_table.R`

-   Reads `data/raw_nba_2025-10-30.csv`.
-   Creates a descriptive summary table (Table 1) of NBA player characteristics using **gtsummary**.
-   Saves outputs as **`output/table1.rds`**.

### `code/02_summary_graphs.R`

### `code/03_ranking.R`

- Reads `data/raw_nba_2025-10-30.csv`.
- Selects the top 10 players by points (PTS).
- Scales key performance metrics (`PTS`, `AST`, `TRB`, `FG%`, `3P%`, `FT%`, `eFG%`) to a 0-1 range.
- Creates a heatmap of relative performance across metrics using **ggplot2**.
- Saves the figure as **`output/ranking_plot.png`**.

### `code/04_regression.R`

-   Reads `data/raw_nba_2025-10-30.csv`.
-   Fits a linear regression model predicting points per 36 minutes from shooting and assist metrics.
-   Saves model objects, summary tables, and the **colored Predicted vs. Actual plot** to the `output/` folder.


------------------------------------------------------------------------

## Report Description

### `NBA_Report.Rmd`

