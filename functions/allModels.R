library(rethinking)


getwd()
source("functions/cleanDataset.R")
source("functions/newModelBuilding.R")


# GENDER
genderGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/gender_group_google_dataset.csv")[,-1])
genderReddit <-  cleanDataset(read.csv("./datasets/macWeatDatasets/gender_group_reddit_dataset.csv")[,-1])

raceGlove <-  cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_glove_dataset.csv")[,-1])
raceGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_google_dataset.csv")[,-1])
raceReddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/race_group_reddit_dataset.csv")[,-1])

religionGlove <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_glove_dataset.csv")[,-1])
religionGoogle <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_google_dataset.csv")[,-1])
religionReddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/religion_group_reddit_dataset.csv")[,-1])


modelGenderGoogle <- buildModel(genderGoogle)
saveRDS(modelGenderGoogle, file = "models/modelGenderGoogle.RDS")
precisGenderGoogle <- extractPrecis(modelGenderGoogle, name = "GenderGoogle")


modelGenderReddit <- buildModel(genderReddit)
saveRDS(modelGenderReddit, file = "models/modelGenderReddit.RDS")
precisGenderReddit  <- extractPrecis(modelGenderReddit, name = "GenderReddit")


modelRaceGlove <- buildModel(raceGlove)
saveRDS(modelRaceGlove, file = "models/modelRaceGlove.RDS")
precisRaceGlove  <- extractPrecis(modelRaceGlove, name = "RaceGlove")

genderGlove <- read.csv("./datasets/macWeatDatasets/gender_group_glove_dataset.csv")[,-1]
genderGlove <- cleanDataset(genderGlove)
modelGenderGlove <- buildModel(genderGlove)
save(modelGenderGlove, file = "models/modelGenderGlove.rda")

# RACE






modelRaceGoogle <- buildModel(raceGoogle)
saveRDS(modelRaceGoogle, file = "models/modelRaceGoogle.RDS")
precisRaceGoogle <- extractPrecis(modelRaceGoogle, name = "RaceGoogle")



modelRaceReddit <- buildModel(raceReddit)
saveRDS(modelRaceReddit, file = "models/modelRaceReddit.RDS")
precisRaceReddit  <- extractPrecis(modelRaceReddit, name = "RaceReddit")


##RELIGION



modelReligionGlove <- buildModel(religionGlove)
saveRDS(modelReligionGlove, file = "models/modelReligionGlove.RDS")
precisReligionGlove  <- extractPrecis(modelReligionGlove, name = "ReligionGlove")


modelReligionGoogle <- buildModel(religionGoogle)
saveRDS(modelReligionGoogle, file = "models/modelReligionGoogle.RDS")
precisReligionGoogle  <- extractPrecis(modelReligionGoogle, name = "ReligionGoogle")



religionReddit <- read.csv("./datasets/macWeatDatasets/religion_group_reddit_dataset.csv")[,-1]
religionReddit <- cleanDataset(religionReddit)

modelReligionReddit <- buildModel(religionReddit)
save(modelReligionReddit, file = "models/modelReligionReddit.rda")


##WEAT


#weat1Glove <- read.csv("./datasets/macWeatDatasets/weat_1_glove.csv")[,-1]
weat1Google <- cleanDataset(read.csv("./datasets/macWeatDatasets/weat_1_google.csv")[,-1])
#"WARNING:  361 out of 18050 (2%) missing comparisons have been removed!"

weat1Reddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/weat_1_reddit.csv")[,-1])
# "WARNING:  6890 out of 18050 (38.1717451523546%) missing comparisons have been removed!"

modelWeat1Google <- buildModel(weat1Google)
save(modelWeat1Google, file = "models/modelWeat1Google.rda")
#saveRDS(modelWeat1Google, file = "models/modelWeat1Google.RDS")
precisWeat1Google  <- extractPrecis(modelWeat1Google, name = "Weat1Google")

modelWeat1Reddit <- buildModel(weat1Reddit)
saveRDS(modelWeat1Reddit, file = "models/modelWeat1Reddit.RDS")
precisWeat1Reddit  <- extractPrecis(modelWeat1Reddit, name = "Weat1Reddit")


weat7Glove <- cleanDataset(read.csv("./datasets/macWeatDatasets/weat_7_glove.csv")[,-1])
#"WARNING:  16 out of 5232 (0.305810397553517%) missing comparisons have been removed!"

weat7Google <- cleanDataset(read.csv("./datasets/macWeatDatasets/weat_7_google.csv")[,-1])
weat7Reddit <- cleanDataset(read.csv("./datasets/macWeatDatasets/weat_7_reddit.csv")[,-1])


modelWeat7Glove <- buildModel(weat7Glove)
saveRDS(modelWeat7Glove, file = "models/modelWeat7Glove.RDS")
precisWeat7Glove  <- extractPrecis(modelWeat7Glove, name = "Weat7Glove")


modelWeat7Google <- buildModel(weat7Google)
saveRDS(modelWeat7Google, file = "models/modelWeat7Google.RDS")
precisWeat7Google  <- extractPrecis(modelWeat7Google, name = "Weat7Google")

modelWeat7Reddit <- buildModel(weat7Reddit)
saveRDS(modelWeat7Reddit, file = "models/modelWeat7Reddit.RDS")
precisWeat7Reddit  <- extractPrecis(modelWeat7Reddit, name = "Weat7Reddit")










