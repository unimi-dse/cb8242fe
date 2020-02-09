#' @title Plot and Simpe return

#' @description Plot the open, the close and the adjusted price of the stock and give a simple stock return.

#' @param symbol Symbol of stock

#' @import utils

#' @export stock_simple_return

stock_simple_return<-function(symbol)
{

  #To ignore the warnings during usage

  options(warn=-1)
  options("getSymbols.warning4.0"=FALSE)

  #Importing price data for the given symbol

  v <- "symbol"
  data1 <- quantmod::getSymbols(Symbols = "v", src = 'yahoo', from="2019-01-01", warnings = FALSE, auto.assign = FALSE)

  #Transforming the XTS to the data frame

  data2 <- data.frame(date=zoo::index(data1), zoo::coredata(data1))

  #Calculating stock return
  result <- merge(data2[,1], (data2[,5]-data2[,2])/data2[,2])
  names(result) <- c("Latest date", "Simple stock return")
  newresult <- tail(result,1)

  #Getting result
  print(newresult, row.names=FALSE)

}


#' @title Plot and Simpe return

#' @description Plot the open, the close and the adjusted price of the stock and give a simple stock return.

#' @param symbol Symbol of stock

#' @import utils

#' @export stock_plot_return

stock_plot_return<-function(symbol)
{
  #To ignore the warnings during usage

  options(warn=-1)
  options("getSymbols.warning4.0"=FALSE)

  #Importing price data for the given symbol

  v <- "symbol"
  data3 <- quantmod::getSymbols(Symbols = "v", src = 'yahoo', from="2018-01-01", warnings = FALSE, auto.assign = FALSE)

  #Transforming the XTS to the data frame

  data4 <- data.frame(date=zoo::index(data3), zoo::coredata(data3))

  #Plotting the data

  priceplot <- ggplot2::ggplot()+ggplot2::geom_line(data = data4,ggplot2::aes(x = data4[,1],y = data4[,2], colour = "price.Open"),size=1)+ggplot2::geom_line(data = data4,ggplot2::aes(x =data4[,1],y = data4[,5],colour ="price.Close"),size=1) + ggplot2::geom_line(data = data4,ggplot2::aes(x = data4[,1],y = data4[,7], colour ="price.Adjusted"),size=1) + ggplot2::scale_colour_manual("",values = c("price.Open" = "blue","price.Close" = "green","price.Adjusted" = "red"))+ggplot2::labs(title="Price trend")+ggplot2::xlab("Time")+ggplot2::ylab("Price")

  #Getting result
  print(priceplot)

}
