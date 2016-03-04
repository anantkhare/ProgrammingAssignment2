

## makeCacheMatrix Function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
        x <- y  
        m <- NULL                              # It stores matrix in cache 
     }
  get <- function() x                          #get matrix
  setInverse <- function(solve)  m <- solve    # Sets the inverse matrix
  getInverse <- function() m                   # Gets the inverse matrix
  list(set = set, get = get,setInverse = setInverse, getInverse = getInverse)  ## Creates a list of functions
}


## cacheSolve Function

cacheSolve <- function(x, ...) {
  m <- x$getInverse()                     # Queries the x matrix's cache returned
  if(!is.null(m)){                        # If there is a cache the inverse has been previously calculated
        message("getting cached data")    # Message indicating Cache 
        return(m)                         # Return the cache  
      }
  data <- x$get()                         # Gets the matrix used by makeCacheMatrix function 
  m <- solve(data, ...)                   # Calculates the inverse of the matrix usinf solve() function
  x$setInverse(m)                         # Stores the inverse matrix in cache using the makeCacheMatrix set function
}
