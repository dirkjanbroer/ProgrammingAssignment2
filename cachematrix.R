## makeCacheMatrix stores the given matrix and the inverse of the given matrix in 2 different objects, usable outside the function

## cacheSolve reads the inverse of the given matrix out of memory when it is the same as the matrix given to makeCacheMatrix

## cacheSolve calculates the inverse of the given matrix when it differs from the matrix given to makeCacheMatrix



## this function creates an object m, usable outside the function, which contains the given matrix

## and it stores the inverse of the given matrix in an object n, also usable outside the function
make
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## If the inverse has already been calculated (and the matrix has not changed)

##    then this function retrieves the inverse from the cache

##    else this function calculates the inverse of the new given matrix

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
## If the inverse has already been calculated and the matrix has not changed

        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mtx <- x$get()
        inv <- solve(mtx, ...)
        x$setinverse(inv)
        inv
}