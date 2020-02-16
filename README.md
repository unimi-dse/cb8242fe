Readme of dseprojectS
=====================

Introduction
------------
This package is only for practice. There are two functions in it. One is for plotting the price trend of stock, one is for calculating the Sharpe ratio of 2019.

Installation
------------
```R
require(sharperatio)
```

Usage
-----
Data comes from yahoo, please enter the symbol of the stock. The following is an example.
```R
sharpe_ratio("FB")
stock_plot_return("FB")
```

Notice
------
Sharpe Ratio calculated in this function is based on S&P500. The result of function sharpe_ratio is not used alone, but used to compare. Between two stocks, the one with higher Sharpe Ratio is better, but just for recommendation.
