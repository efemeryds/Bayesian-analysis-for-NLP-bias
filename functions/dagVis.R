library(dagitty)
library(rethinking)

dagBayesBias <- dagitty( 
  "dag{
  distances -> associated
  distances -> different
  distances -> human
  distances -> neutral
  
  associated -> protectedWord1
  associated -> protectedWord2
  associated -> protectedWord3
  
  different -> protectedWord1
  different -> protectedWord2
  different -> protectedWord3
  
  human -> protectedWord1
  human -> protectedWord2
  human -> protectedWord3
  
  neutral -> protectedWord1
  neutral -> protectedWord2
  neutral -> protectedWord3
  
  protectedWord1 -> attribute1
  protectedWord1 -> attribute2
  protectedWord1 -> attribute3
  protectedWord1 -> attribute4
  
  protectedWord2 -> attribute1
  protectedWord2 -> attribute2
  protectedWord2 -> attribute3
  protectedWord2 -> attribute4
  protectedWord3 -> attribute1
  protectedWord3 -> attribute2
  protectedWord3 -> attribute3
  protectedWord3 -> attribute4
  }
  " 
)

coordinates(dagBayesBias) <- list(
  x=c(
    distances = 2.5, associated = 1, different = 2, human = 3, neutral = 4,
    protectedWord1 = 1.5, protectedWord2 = 2.5, protectedWord3 = 3.5,
    attribute1 = 1, attribute2 = 2, attribute3 = 3, attribute4 = 4
  ) ,
  y=c(
    distances = .5, associated = 1, different = 1, human = 1, neutral = 1,
    protectedWord1 = 2, protectedWord2 = 2, protectedWord3 = 2,
    attribute1 = 3, attribute2 = 3, attribute3 = 3, attribute4 = 3
  ) )


drawdag(dagBayesBias)

