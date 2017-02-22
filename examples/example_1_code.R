# Example 1
# Specify x and y variables of equal lengths
x = c(1, 2, 3, 4, 5)
y = c(1, 3, 6, 10, 11)

# open new window in mac
quartz()

# plot regular function
plot(x, y)

# plot paulyplot on top of regular function
paulyplot(x, y)
