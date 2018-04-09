## The following set of functions serve to either calculate the inverse of
## a matrix and store that inverse in the cache or, in the event that the 
## calculation has already been performed, gets the inverse matrix from the 
## cache

## Creating a list containing a function to (1) set the value of a matrix, 
## (2) get the value of a matrix, (3) set the inverse of the matrix, and (4) 
## get the inverse of the matrix
```{r}
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) i <<- solve
  getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## First checking to see if the inverse of the matrix has already been 
## calculated.  If so, it gets the inverse from the cache and skips the
## computation.  Otherwise, it calculates the inverse of the matrix and
## stores that inverse matrix in the cache.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}

```
