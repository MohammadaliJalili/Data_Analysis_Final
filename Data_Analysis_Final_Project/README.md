# Data Analysis and Visualization Chinook Dataset

This Python script provides a comprehensive set of functions for data analysis, visualization, and statistical testing. It's designed to work with a SQL database and perform various operations on the data.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone this repository to your local machine.
2. Install the required dependencies (see [Dependencies](#dependencies) section).
3. Ensure you have a MySQL database set up and accessible.
4. Create a `DB_Config.json` file in the same directory as the script with your database configuration:

```json
{
  "DataBaseConfig": {
    "host": "your_host",
    "port": "your_port",
    "user": "your_username",
    "password": "your_password",
    "database": "your_database_name"
  }
}
```
## Features

1. Data Loading and Preprocessing
   - Connects to a MySQL database
   - Loads tables into pandas DataFrames

2. Data Description
   - Custom `beautify_desc` function for enhanced describe output

3. Statistical Analysis
   - Correlation analysis between categorical and numeric variables
   - Chi-squared tests
   - Mutual Information calculation
   - Random Forest feature importance

4. Data Visualization
   - Q-Q plots
   - Histograms
   - Bar charts
   - Pie charts
   - Time series plots

5. Outlier Detection
   - Z-score method
   - IQR method
   - Isolation Forest method

6. Hypothesis Testing
   - Shapiro-Wilk test
   - Anderson-Darling test
   - T-tests

7. Confidence Interval Calculation

Dependencies:
- numpy
- sqlalchemy
- pandas
- matplotlib
- seaborn
- scipy
- scikit-learn

## Features and Functions

1. Data Loading and Preprocessing
   - `create_engine()`: Creates SQLAlchemy engine for database connection
   - `inspect()`: Inspects database to fetch table names
   - Pandas `read_sql()`: Loads tables into DataFrames

2. Data Description
   - `beautify_desc(df, columns)`: Enhances DataFrame's describe output
     - Formats statistics with commas and decimal places
     - Converts 'count' to integer format

3. Statistical Analysis
   - `categorical_numeric_correlations(df, cat_cols, num_col)`: Analyzes relationships between categorical and numeric variables
     - Performs Chi-squared test
     - Calculates Mutual Information
     - Computes Random Forest feature importance

4. Data Visualization
   - `q_q_plot(df, num_cols)`: Creates Q-Q plots for numeric columns
   - `plot_histograms(df, columns, bins=50, figsize=(15, 6))`: Generates histograms with mean and median lines
   - Various matplotlib and seaborn plots:
     - Bar charts for genre distribution
     - Pie charts for media type distribution
     - Time series plots for sales data

5. Outlier Detection
   - `z_score_outliers_fun(df, columns, limit)`: Detects outliers using Z-score method
   - `iqr_outliers_fun(df, columns)`: Identifies outliers using Interquartile Range (IQR) method
   - `isolation_forest_outliers(df, columns, contamination=0.01)`: Detects outliers using Isolation Forest algorithm

6. Hypothesis Testing and Statistical Analysis
   - `shapiro()`: Performs Shapiro-Wilk test for normality
   - `anderson()`: Conducts Anderson-Darling test for normality
   - `ttest_ind()`: Executes independent t-test
   - `chi2_contingency()`: Performs Chi-square test of independence
   - `linregress()`: Conducts linear regression analysis

7. Confidence Interval Calculation
   - `calculate_confidence_interval(data, confidence=0.95)`: Computes confidence intervals for given data

8. Data Merging and Grouping
   - Various uses of pandas `merge()`, `groupby()`, and aggregation functions to combine and summarize data

9. Custom Data Analysis
   - Analysis of track sales by genre
   - Investigation of relationships between track duration, price, and sales
   - Country-wise analysis of sales data

10. Data Cleaning and Transformation
    - Handling of null values
    - Date extraction for time-based analysis
    - Creation of derived variables (e.g., Total_Sale)

11. Advanced Visualization Techniques
    - Violin plots and KDE plots for distribution comparisons
    - Heatmaps for visualizing relationships between categorical variables
    - Error bar plots for confidence interval visualization