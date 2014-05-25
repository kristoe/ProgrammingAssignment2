## Eric J. Kristoff
## kristoe@yahoo.com

## set of functions for R Programming course, week #3

makeCacheMatrix <- function(x = matrix()) {
  ## this function creates a matrix object that has the ability to cache itself
  
  matrixToReturn <- NULL
  set <- function(y) {
    ## internal subfunction to manually set the matrix
    x <<- y
    matrixToReturn <<- NULL
  }
  get <- function() {
    ## internal subfunction to retrieve the matrix
    x
  }
  setInverse <- function(toSolve) {
    ## internal subfunction to set the inverted matrix
    matrixToReturn <<- toSolve
  }
  getInverse <- function() {
    ## internal subfunction to retrieve th
    matrixToReturn
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


cacheSolve <- function(x, ...) {
  ## thie function returns a matrix that is the inverse of parameter 'x'
  
  inverseToReturn <- x$getInverse()
  if(!is.null(inverseToReturn)) {
    ## if the member variable inverseToReturn is NOT null, then just use what we already have
    message("getting cached matrix data")
    return(inverseToReturn)
  }
  ## if the member variable inverseToReturn is null, then we need to find it
  data <- x$get()
  inverseToReturn <- solve(data, ...)
  x$setInverse(inverseToReturn)
  inverseToReturn
}  
