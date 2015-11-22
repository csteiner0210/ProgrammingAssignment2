## Overall the first function acts as a storage function for the 
## second function.  The second function searches to find if there is
## cached data.  If no cached data, then it runs the inverse function 
## on the new data.

    ## This returns a list of functions that creates a new vector and caches it
    ## The function contains one argument and the function returns a list
makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  
  setMatrix <- function(new) {
    x <<- new
    cache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
 getInverse <- function() {
    cache
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

    ## cacheSolve function looks to see if there is cached data 
    ## if no cached data is available then it runs the inverse function (solve)
cacheSolve <- function(x, ...) {
  
  inverse <- y$getInverse()
 
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  inverse
}