## First function, 'makeMatrix' creates a special "matrix", which is really
## a list containing a function to:
##   1. set the value of the matrix;
##   2. get the value of the matrix;
##   3. set the value of the inverse;
##   4. get the value of the inverse.

makeMatrix = function(x = matrix()) {
      m = NULL
      set = function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}

## The following function calculates the inverse of the special "matrix" created
## with the above function. However, it first checks to see if the inverse has 
## already been calculated. If so, it gets the inverse from the cache and skips
## the computation. Otherwise, it calculates the inverse of the data and sets
## the value of the inverse in the cache via the 'setinverse' function.
## Note: a square matrix has an inverse if its determinant is != 0.

cacheSolve = function(x,...) {
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      matrix <- x$get()
      m <- solve(matrix, ...)
      x$setinverse(m)
      m
}

## Example

# a = makeMatrix(matrix(1:4,nrow=2))
# cachesolve(a) # run twice