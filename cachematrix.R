## The following makes a structure for storing the inverse of a matrix. When the inverse of a matrix is accessed from the structure, the cache is first searched to find it, otherwise, the inverse is computed and stored in the cache.


## this function makes a list containing the internals of a cache for retrieving the inverse of a matrix
## @param x an invertible matrix
## @return a list

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## this functon retrieves the inverse of the matrix stored in x, computing the inverse if necessary
## @param x a list returned by makeCacheMatrix
## @return the inverse of the matrix stored in x

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
	message("not in cache: computing inverse")
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

### example usage
# cache <- makeCacheMatrix(matrix(runif(25),5,5))
# cacheSolve(cache) # can't find in cache
# cacheSolve(cache) # will find in cache
