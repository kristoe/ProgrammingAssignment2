## Eric J. Kristoff
## kristoe@yahoo.com

## NOTE : the overall approach required by the assignment works, but is bad software engineering
## form, by creating coupling between the two functions.  Additionally, the variable naming conventions
## in the sample code overloaded variable names, creating unnecessary confusion, which would
## make the code more difficult to maintain later.


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
    message("getting cached matrix data")
    return(inverseToReturn)
  }
  ## if the member variable inverseToReturn is null, then we need to find it
  data <- x$get()
  inverseToReturn <- solve(data, ...)
  x$setInverse(inverseToReturn)
  inverseToReturn
}  
