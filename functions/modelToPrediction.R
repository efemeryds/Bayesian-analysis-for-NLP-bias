library(rethinking)


modelToPredictions <- function(model, dataset, name){
  predictions <- rethinking::sim(model )
  predictedMean <- apply( predictions , 2 , mean )
  predicted89 <- apply( predictions , 2 , HPDI, prob = .89 )
  predicted5 <- apply( predictions , 2 , HPDI, prob = .5 )
  
  dataset2 <- dataset
  dataset2$predictedMean <- predictedMean
  
  pr89 <- as.data.frame(t(predicted89))
  pr5 <- as.data.frame(t(predicted5))
  
  colnames(pr89) <- c("low89", "high89")
  colnames(pr5) <- c("low5", "high5")
  
  dataset2 <- cbind(dataset2, pr89, pr5)
  
  dataset2$set <- rep(name, nrow(dataset2))
  
  dataset2$within89 <-( dataset2$distance >= dataset2$low89 ) &
                    (dataset2$distance <= dataset2$high89)
  
  
  return(dataset2)
}
