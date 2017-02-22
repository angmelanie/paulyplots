# Example 2 with pre-loaded airquality dataset
data("airquality")
head(airquality) # view data set to select variables

# dataset too large so i will subset some points
airquality_subset <- subset(airquality, (Day <= 3))
airquality_subset # view data frame, looks good

# assigning variables
x = airquality_subset$Wind
y = airquality_subset$Temp

#open new window
quartz()

# regular plot
with(airquality_subset, plot(Wind, Temp, type = "n"))

# paulyplot
paulyplot(x, y)