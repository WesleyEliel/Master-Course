departements <- read.csv("./departments.csv", header = FALSE, sep = " ", quote = '"')

apply(departements, 1, function(row) {
  print(paste(row, collapse = ", "))
})