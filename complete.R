complete <- function(directory, id = 1:332) {
      #create an empty vector for complete cases of the records    
    comp <- c()
    
    #create an empty vector for ids   
    ids <- c()
    
    #list all files in the directory
    filenames <- list.files(directory)
    
    #for each .csv file  in id
    for(i in id) {
          #concatenate directory and filenames 
      filepath <- paste(directory, '/', filenames[i], sep = "")
      #read in each file and store in data
      data <- read.csv(filepath, header = TRUE)
      
      #get a subset of all rows with complete data, so no NAs 
      #completecases = subset(data, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na(id), select = TRUE)
      completecases <- data[complete.cases(data),]
      
      #use i for id and concatenate a vector of ids
      ids <- c(ids, i)
      #concatenate the number of completed rows from the subset into comp vector
      comp <- c(comp, nrow(completecases))
      
      
    }
    #return a dataframe of id and nobs
    data.frame(id=ids, nobs=comp)
}