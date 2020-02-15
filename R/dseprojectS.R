#' @title Plot and Simpe return

#' @description Get data from the package

#' @param x Symbol of stock

#' @import utils

#' @return price data of the chosen stock

#' @export data_import

data_import<-function(x)
{

  #To ignore the warnings during usage

  options(warn=-1)
  options("getSymbols.warning4.0"=FALSE)

  #Importing price data for the given symbol

  data1 <- quantmod::getSymbols(Symbols = x, src = "yahoo",auto.assign =FALSE, from="2018-01-01")

  #Transforming the XTS to the data frame

  data2 <- data.frame(date=zoo::index(data1), zoo::coredata(data1))
  return(data2)

}

#' @title Plot and Simpe return

#' @description Plot the open, the close and the adjusted price of the stock and give a simple stock return.

#' @param x Symbol of stock

#' @import utils

#' @return stock return rate of the latest date

#' @export stock_simple_return

stock_simple_return<-function(x)
{

  #Importing data
  data3 <- data_import(x)

  #Calculating stock return
  result <- merge(data3[,1], (data3[,5]-data3[,2])/data3[,2],row.names=FALSE)
  names(result) <- c("Latest date", "Simple stock return")
  newresult <- tail(result,1)

  #Getting result
  return(newresult)

}


#' @title Plot and Simpe return

#' @description Plot the open, the close and the adjusted price of the stock and give a simple stock return.

#' @param x Symbol of stock

#' @import utils

#' @return plot of the chosen stock

#' @export stock_plot_return

stock_plot_return<-function(x)
{

  #Importing data
  data4 <- data_import(x)

  #Plotting the data
  priceplot <- ggplot2::ggplot()+ggplot2::geom_line(data = data4,ggplot2::aes(x = data4[,1],y = data4[,2], colour = "price.Open"),size=1)+ggplot2::geom_line(data = data4,ggplot2::aes(x =data4[,1],y = data4[,5],colour ="price.Close"),size=1) + ggplot2::geom_line(data = data4,ggplot2::aes(x = data4[,1],y = data4[,7], colour ="price.Adjusted"),size=1) + ggplot2::scale_colour_manual("",values = c("price.Open" = "blue","price.Close" = "green","price.Adjusted" = "red"))+ggplot2::labs(title="Price trend")+ggplot2::xlab("Time")+ggplot2::ylab("Price")

  #Getting result
  return(priceplot)

}
