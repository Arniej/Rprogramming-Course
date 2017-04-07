##Complete.R function##

complete <- function(directory, id = 1:332){
    files_list <- list.files(directory, full.names=TRUE)
    nobs <- c()
    for (i in id){
        dat <- read.csv(files_list[i])
        nobs <- c(nobs, sum(complete.cases(dat)))
    }
    data.frame(id, nobs)
}