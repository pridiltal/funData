### Names for functional data objects
### no particular method needed for multiFunData!

#' @describeIn funData Get the names of the \code{funData} object.
#' 
#' @param x The \code{funData} object.
#' 
#' @docType methods
#'
#' @exportMethod names
setMethod("names", signature = "funData",
          function(x)
          {
           return(dimnames(x@X)[[1]] ) 
          })


#' @describeIn funData Set the names of the \code{funData} object.
#' 
#' @inheritParams names
#' @param value The names to be given to the \code{funData} curves.
#' 
#' @docType methods
#'
#' @exportMethod names<-
setMethod("names<-", signature = "funData",
          function(x, value)
          {
            if(!is.null(value) & length(value) != nObs(x))
              stop("Names must have the same length as funData object.")
            
            dimnames(x@X)[[1]] <- value
            
            return(x)
          })


#' @describeIn multiFunData Get the names of the \code{multiFunData} object.
#' 
#' @param x The \code{multiFunData} object.
#' 
#' @docType methods
#'
#' @exportMethod names
setMethod("names", signature = "multiFunData",
          function(x)
          {
            return(names(S3Part(x, strictS3 = TRUE))) 
          })


#' @describeIn multiFunData Set the names of the \code{multiFunData} object.
#' 
#' @inheritParams names
#' @param value The names to be given to the \code{multiFunData} curves.
#' 
#' @docType methods
#'
#' @exportMethod names<-
setMethod("names<-", signature = "multiFunData",
          function(x, value)
          {
            if(!is.null(value) & length(value) != length(x))
              stop("Names must have the same length as multiFunData object.")
            
            names(S3Part(x, strictS3 = TRUE)) <- value
            
            return(x)
          })


#' @describeIn irregFunData Get the names of the \code{irregFunData} object.
#' 
#' @param x The \code{irregFunData} object.
#' 
#' @docType methods
#'
#' @exportMethod names
setMethod("names", signature = "irregFunData",
          function(x)
          {
            return(names(x@argvals)) 
          })


#' @describeIn irregFunData Set the names of the \code{irregFunData} object.
#' 
#' @inheritParams names
#' @param value The names to be given to the \code{irregFunData} curves.
#' 
#' @docType methods
#'
#' @exportMethod names<-
setMethod("names<-", signature = "irregFunData",
          function(x, value)
          {
            if(!is.null(value) & length(value) != nObs(x))
              stop("Names must have the same length as irregFunData object.")
            
            names(x@argvals) <- value
            names(x@X) <- value
            
            return(x)
          })