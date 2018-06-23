pollutantmode <- function(directory, pollutant, id = 1:332) {
          #create an empy vector of pollutants
          pollutants <- c()
          
          #get a list of file names
          filenames <- list.files(directory)
          
          #for each .csv file in id
          for(i in id) {
              #concatenate the directory and file name""
              #example - directory = "C:/folder", filenames = monitor("001.csv", "002.csv", "003.csv", ...), filepath="C:/folder/001.csv"
              filepath <- paste(directory, "/", filenames[i], sep = "")
              
              #read in each file and store it in data
              data <- read.csv(filepath, header = TRUE)
              
              #concatenate the vectors from each file of the pollutant('sulfate' or 'nitrate') column to pollutants vector
              pollutants <- c(pollutants, data[,pollutant])
              
          }
          #get the mean of the pollutants and remove NA values
          #R base does not have a mode() function, but the package "modeest" can be used to get the mode by typing mfv(most freq value)
          pollutants_mode <- mfv(pollutants, na.rm = TRUE)
          
          
          #return the mean 'pollutants_mode'
          pollutants_mode
}