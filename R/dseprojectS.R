#' @title Plot and Simpe return

#' @description Plot the open, the close and the adjusted price of the stock and give a simple stock return.

#' @param x Desription of argument

#' @return NULL

#' @import utils

#' @export stock_simple_return

stock_simple_return<-function(x)
{

  #To ignore the warnings during usage

  options(warn=-1)

  options("getSymbols.warning4.0"=FALSE)

  #Importing price data for the givensymbol

  data <- quantmod::getSymbols(Symbols = 'x', src = 'yahoo', auto.assign = FALSE)

  #Transforming the XTS to the data frame

  data <- data.frame(date=zoo::index(data), zoo::coredata(data))

  #Renaming the columns

  colnames(data) <-c("date","price.Open","price.High","price.Low","price.Close","data.Volume","price.Adjusted")

  #Plotting the data
  priceplot <- ggplot2::ggplot()+ggplot2::geom_line(data = data,ggplot2::aes(x = data[,1],y = data[,2], colour = "price.Open"),size=1)+ggplot2::geom_line(data = data,ggplot2::aes(x =data[,1],y = data[,5],colour ="price.Close"),size=1) + ggplot2::geom_line(data = data,ggplot2::aes(x = data[,1],y = data[,7], colour ="price.Adjusted"),size=1) + ggplot2::scale_colour_manual("",values = c("price.Open" = "blue","price.Close" = "green","price.Adjusted" = "red"))+ggplot2::labs(title="Price trend")+ggplot2::xlab("Time")+ggplot2::ylab("Price")

  #Calculating stock return
  simplereturn <- (data[,5]-data[,2])/data[,2]
  result <- merge(data[,1], (data[,5]-data[,2])/data[,2])
  names(result) <- c("Latest date", "Simple stock return")
  newresult <- tail(result,1)

  #Getting result
  print(newresult,row.names=FALSE)
  print(priceplot)

}
