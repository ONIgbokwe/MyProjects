source("complete.R")
corr <- function(directory, threshold = 0){
        
        completes <- complete(directory, 1:332)
        completes_above_threshold <- subset(completes, nobs > threshold)
  
        #create an empty vector cor_data 
        cor_data <- vector()
        
        #get the list of filenames in specdata 
        filenames <- list.files(directory)
        
        #for each .csv file in id 
        for (i in completes_above_threshold$id) {
          
              #concatenate the directory and file name
              #example directory= "C:/folder", filenames = vector("001.csv", "002.csv", "003.csv"...), filepath ="C:/folder/001.csv")
              filepath <- paste(directory, "/" ,filenames[i], sep = "")
              
              #read in each file and store it in data
              data <- read.csv(filepath, header = TRUE)
              
              #calculate and store the number of completed cases
              completecases <- data[complete.cases(data),]
              count <- nrow(completecases)
              
              #calculate and store the count of completed cases
              #if threshold is reached
              if(count >= threshold) {
                  cor_data <- c(cor_data, cor(completecases$nitrate, completecases$sulfate))
              }
             
              
         }
   
        cor_data
}
      #r i.e Pearson correlation coefficient = 
            #covariance(x,y)/(sd(x)*sd(y))