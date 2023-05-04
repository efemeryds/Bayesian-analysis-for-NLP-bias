library(ggplot2)
library(ggthemes)
library(gridExtra)
library(grid)


predictions <- readRDS(file = "resultsDFs/predictionsAll.RDS")
simulated <- readRDS(file = "resultsDFs/simulatedAll.RDS")



posteriorCheckPlotA <- function(dataset2, name){
  rate89 <- mean(( dataset2$distance >= dataset2$low89 ) & (dataset2$distance <= dataset2$high89))
  rate5 <- mean(( dataset2$distance >= dataset2$low5) & (dataset2$distance <= dataset2$high5))
  
  p1 <- ggplot(dataset2)+ geom_pointrange(aes(x = predictedMean,
                                              y = distance, ymin = low89, ymax = high89,
                                              color = connection),
                                          size = .005, alpha = .2)+
    scale_color_manual(values = c("associated" ="orangered4", 
                                  "different" = "chartreuse4",
                                  "human" = "skyblue",
                                  "none" = "grey"))+
    geom_abline(lty = 2, size =.2) +theme_tufte(base_size = 7)+
    theme(plot.title.position = "plot",
          legend.position =  c(.15,.9),
          legend.title=element_blank(),
          legend.key.height= unit(.2, 'cm'))+
    xlab("predicted distance with 89% HPDI")+
    ylab("actual distance")+
    labs(title = paste("Predicted vs actual distances (", name , ")", sep = ""),
         subtitle = paste(round(rate89,2)*100,
                          "% within 89% HPDI, ",
                          round(rate5,2)*100, "% within 50% HPDI", sep = ""))
  
  return(p1)
}



posteriorCheckPlotB <- function(dataset2,simulatedValues, name){
  
  distances <- c(dataset2$distance, c(simulatedValues))
  
  source <- c(rep("observed",length(dataset2$distance)),
              rep("predicted", length(c(simulatedValues))))
  densitiesData <- data.frame(distance = distances, 
                              source = source)
  
  
p2 <- ggplot(densitiesData)+geom_density(aes(x = distance, fill = source,
                                             color = source), alpha = .4)+theme_tufte(base_size = 7)+
  theme(legend.position =  c(.15,.9),
        legend.title=element_blank(),
        legend.key.height= unit(.2, 'cm'))+
  ggtitle(paste("Densities (", name , ")", sep = ""))
}


