library(magrittr)
library(dplyr)

# This function generates the initial grid of NA's. It also generates the grid of hidden values (na = FALSE).
generate_grid <- function(dim, na = FALSE){
  if(na){
    return(as.data.frame(matrix(rep(NA_integer_, dim^2), nrow = dim)))
  } else {
    return(as.data.frame(matrix(sample(dim^2), nrow = dim)))
  }
}

# This function obtains the cell indices that are equal or different (equal.cells = TRUE)
get_index <- function(x, y, equal.cells = TRUE){
  if(equal.cells){
    i <- which(x == y, arr.ind = TRUE)
    
    row_index <- i[, 1] - 1
    names(row_index) <- NULL
    
    col_index <- i[, 2] - 1
    names(col_index) <- NULL
    
    return(
      list(
        row_index = row_index,
        col_index = col_index
      )
    )
  } else {
    i <- which(x != y, arr.ind = TRUE)
    
    row_index <- i[, 1] - 1
    names(row_index) <- NULL
    
    col_index <- i[, 2] - 1
    names(col_index) <- NULL
    
    return(
      list(
        row_index = row_index,
        col_index = col_index
      )
    )
  }
}

# This function obtains the NA cell indices
get_na_index <- function(x){
  i <- which(is.na(x), arr.ind = TRUE)
  
  row_index <- i[, 1] - 1
  names(row_index) <- NULL
  
  col_index <- i[, 2] - 1
  names(col_index) <- NULL
  
  list(
    row_index = i[, 1],
    col_index = i[, 2]
  )
}
