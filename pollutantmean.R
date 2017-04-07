##Pollutant Mean##

pollutantmean <- function(directory, pollutant, id = 1:332){
    dat <-  numeric()
    for (i in id) {
        select_file <- file.path(directory, paste(sprintf("%03d", i), ".csv", sep="")) ##some C type code, need to work this one##
        data_subset <- read.csv(select_file, header=TRUE)
        not_NA <- !is.na(data_subset[, pollutant])
        dat <- c(dat, data_subset[not_NA, pollutant])
    }
    mean(dat)
}
