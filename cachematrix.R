## makeCacheMatrix stores the given matrix and the inverse of the given matrix in 2 different objects, usable outside the function

## cacheSolve reads the inverse of the given matrix out of memory when it is the same as the matrix given to makeCacheMatrix

## cacheSolve calculates the inverse of the given matrix when it differs from the matrix given to makeCacheMatrix



## this function creates an object m, usable outside the function, which contains the given matrix

## and it stores the inverse of the given matrix in an object n, also usable outside the function
make
CacheMatrix <- function(x = matrix()){

    m <<- x
  
    n <<- solve(m)

}



## If the inverse has already been calculated (and the matrix has not changed)

##    then this function retrieves the inverse from the cache

##    else this function calculates the inverse of the new given matrix

cacheSolve <- function(o){

## If the inverse has already been calculated and the matrix has not changed

  if(exists("n") && identical(o,m))  {

    return(n)

  }

  else    {

    return(solve(o))

  }

}
