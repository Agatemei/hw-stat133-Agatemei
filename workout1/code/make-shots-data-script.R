# title: make shots data
# description: create a csv data file shots-data.csv that will contain the required variables to be used in the visualization phase.
# input(s): five csv data files (raw data)
# output(s): summary of five players respectively and totally

library(readr)

# Read in the five data sets, using relative file paths

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
draymond <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

# Add a column name to each imported data frame, that contains the name of the corresponding player:

curry$name = c("Stephen Curry")
durant$name = c("Kevin Durant")
klay$name = c("Klay Thompson")
draymond$name = c("Draymond Green")
iguodala$name = c("Andre Iguodala")

# Change the original values of shot_made_flag to more descriptive values
# Replace "n" with "shot_no", and "y" with "shot_yes":

curry$shot_made_flag[curry$shot_made_flag == "n"] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] = "shot_yes"
klay$shot_made_flag[klay$shot_made_flag == "n"] = "shot_no"
klay$shot_made_flag[klay$shot_made_flag == "y"] = "shot_yes"
draymond$shot_made_flag[draymond$shot_made_flag == "n"] = "shot_no"
draymond$shot_made_flag[draymond$shot_made_flag == "y"] = "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] = "shot_yes"

# Add a column minute that contains the minute number where a shot occurred.

curry$minute <- curry$period * 12 - curry$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
klay$minute <- klay$period * 12 - klay$minutes_remaining
draymond$minute <- draymond$period * 12 - draymond$minutes_remaining
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining

# Use sink() to send the summary() output of each imported data frame into individuals text files:

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(draymond)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(klay)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

# Use the row binding function rbind() to stack the tables into one single data frame.

shots_data <- rbind(curry, durant, draymond, iguodala, klay)

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/.
# Use a relative path for this operation.

write_csv(x = shots_data, path = "../data/shots-data.csv")

# Use sink() to send the summary() output of the assembled table. 
# Send this output to a text file named shots-data-summary.txt inside the output/ folder.

sink(file = "../output/shots-data-summary.txt")
summary(shots_data)
sink()
