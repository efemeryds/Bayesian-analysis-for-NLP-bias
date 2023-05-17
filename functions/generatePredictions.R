
source("functions/cleanDataset.R")
source("functions/modelToPrediction.R")


predictions <- list()


genderGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/gender_group_google_dataset.csv")[,-1])
genderReddit <-  cleanDataset(read.csv("./datasets/macWeatDatasets/gender_group_reddit_dataset.csv")[,-1])
genderGlove <- read.csv("./datasets/macWeatDatasets/gender_group_glove_dataset.csv")[,-1]
genderGlove <- cleanDataset(genderGlove)

raceGlove <-  cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_glove_dataset.csv")[,-1])
raceGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_google_dataset.csv")[,-1])
raceReddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_reddit_dataset.csv")[,-1])

religionGlove <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_glove_dataset.csv")[,-1])
religionGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_google_dataset.csv")[,-1])
religionReddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_reddit_dataset.csv")[,-1])



modelList <- c(
  "modelReligionGoogle.RDS", "modelReligionGlove.RDS", "modelReligionReddit.RDS",
  "modelRaceReddit.RDS", "modelRaceGoogle.RDS", "modelRaceGlove.RDS", 
  "modelGenderReddit.RDS", "modelGenderGoogle.RDS", "modelGenderGlove.RDS",
  #"modelWeat1Reddit.RDS", #, "modelWeat1Glove.RDS
  # "modelWeat7Reddit.RDS", "modelWeat7Google.RDS", "modelWeat7Glove.RDS"
)


simulated <- list()


model <- readRDS(file = "models/modelReligionGoogle.RDS")
simulated$religionGoogle <- sim(model)

predictions$religionGoogle <- modelToPredictions(model, religionGoogle, "religionGoogle")

model <- readRDS(file = "models/modelReligionGlove.RDS")
simulated$religionGlove <- sim(model)

predictions$religionGlove <- modelToPredictions(model, religionGlove, "religionGlove")

load(file = "models/modelReligionReddit.rda")
model <- modelReligionReddit
simulated$religionReddit <- sim(model)

predictions$religionReddit <- modelToPredictions(model, religionReddit, "religionReddit")

model <- readRDS(file = "models/modelRaceReddit.RDS")
simulated$raceReddit <- sim(model)

predictions$raceReddit <- modelToPredictions(model, raceReddit, "raceReddit")

#5
model <- readRDS(file = "models/modelRaceGoogle.RDS")
simulated$raceGoogle <- sim(model)

predictions$raceGoogle <- modelToPredictions(model, raceGoogle, "raceGoogle")


#6
model <- readRDS(file = "models/modelRaceGlove.RDS")
simulated$raceGlove <- sim(model)

predictions$raceGlove <- modelToPredictions(model, raceGlove, "raceGlove")

#7
model <- readRDS(file = "models/modelGenderReddit.RDS")
simulated$genderReddit <- sim(model)

predictions$genderReddit <- modelToPredictions(model, genderReddit, "genderReddit")

#8
model <- readRDS(file = "models/modelGenderGoogle.RDS")
simulated$genderGoogle <- sim(model)

predictions$genderGoogle <- modelToPredictions(model, genderGoogle, "genderGoogle")

#9
load(file = "models/modelGenderGlove.rda")
model <- modelGenderGlove

simulated$genderGlove <- sim(model)

predictions$genderGlove <- modelToPredictions(model, genderGlove, "genderGlove")


saveRDS(predictions, "resultsDFs/predictionsAll.RDS")


saveRDS(simulated, "resultsDFs/simulatedAll.RDS")
