
## The purpose of this function is to generate a Matrix and calculate the inverse of
## that matrix

## This first part of the code creates a special "matrix" object that can cache its inverse.
## Basically the code creates a list containing a function to set the value of 
## the matrix, get the values of the matrix, set the values of the inverse of the 
## matrix, and last but not least, getting the inverse values of the matrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {  ## Not really used
        x <<- y
        inv <<- NULL
    }tmp
    get <- function() x
    setinv <- function(solve) inv <<- solve  
    getinv <- function() inv
    list (set = set, get = get, setinv = setinv, getinv = getinv)
}


## The following code will calculate the inverse of the matrix given/returned by 
## the makeCacheMatrix function above after having checked if the inverse have 
## already been calculated (or the matrix have changed)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("Getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}

## Have a nice day, and thank you for reading my code
