Readme of dseprojectS
=====================

Introduction
------------
There are two functions in this package. Running function "Stock_simple_return()", you can get a simple stock return of lastest date. Running function "Stock_plot_return", you can get the plot of the open, the close and the adjusted price of the stock you enter. 

Installation
------------
```R
require(dseprojectS)
```

Usage
-----
Data comes from yahoo, please enter the symbol of the stock. The following is an example.
```R
stock_simple_return("FB")
stock_plot_return("FB")
```
