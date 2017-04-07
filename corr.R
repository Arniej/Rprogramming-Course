corr <- function(directory, threshold = 0) {
    
    init_m <- complete(directory)
    init_ms <- subset(init_m,init_m[,2]>=threshold)
    
    id <- init_ms[,1]
    
    m <- data.frame(matrix(ncol = 4))
    n <- c()
    names(m) <- c("Date","sulfate","nitrate","ID")
    
    for (i in seq_along(id)) 
    {
        
        filename <- paste(if (id[i] < 10) {paste("00",id[i],sep="")} 
                else if (id[i] < 100) {paste("0",id[i],sep="")} 
                else {as.character(id[i])}
                
                ,".csv"
                ,sep=""
            )
        m <- read.csv(paste(getwd(),"/",directory,"/",filename,sep=""))
        Y <- subset(m[,2:3],!is.na(m[,2]) & !is.na(m[,3]))
        n <- c(n,cor(Y[,1],Y[,2]))
    }
    
    return(n)
}
