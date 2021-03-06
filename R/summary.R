### Summary methods for functional data classes ###

#' @describeIn funData A \code{summary} method for \code{funData} objects.
#'
#' @param ... Other parameters passed to \code{summary}.
#'
#' @docType methods
#'
#' @exportMethod summary
setMethod("summary", signature = "funData",
          function(object, ...)
          {
            argvalsSummary <- do.call("rbind", lapply(object@argvals, summary, ...))
            rownames(argvalsSummary) <- paste("Dim.", seq_len(dimSupp(object)), ":")
            
            XSummary <- apply(object@X, 1, function(x){summary(as.numeric(x))})
            colnames(XSummary) <- {
              if(is.null(names(object)))
                 paste("Obs", seq_len(nObs(object)))
              else
                   names(object)
            }
            
            res <- list(argvals = argvalsSummary, X = XSummary)
            class(res) <- "summary.funData"
            
            return(res)
          })


#' @describeIn multiFunData A \code{summary} method for \code{multiFunData} objects.
#' 
#' @param object A \code{multiFunData} object.
#'
#' @docType methods
#'
#' @exportMethod summary
setMethod("summary", signature = "multiFunData",
          function(object, ...)
          {
            res <- lapply(object, summary, ...)
            class(res) <- "summary.multiFunData"
            
            return(res)
          })


#' @describeIn irregFunData A \code{summary} method for \code{irregFunData} objects.
#' 
#' @param ... Other parameters passed to \code{summary}.
#'
#' @docType methods
#'
#' @exportMethod summary
setMethod("summary", signature = "irregFunData",
          function(object, ...)
          {
            obsNames <- {
              if(is.null(names(object)))
                paste("Obs", seq_len(nObs(object)))
              else
                names(object)
            }
            
            argvalsSummary <- do.call("cbind", lapply(object@argvals, summary))
            colnames(argvalsSummary) <- obsNames
            
            XSummary <- do.call("cbind", lapply(object@X, summary))
            colnames(XSummary) <- obsNames
            
            res <- list(argvals = argvalsSummary, X = XSummary)
            class(res) <- c("summary.irregFunData")
            
            return(res)
          })


#' @keywords internal
#' 
#' @export
print.summary.funData <- function(x, ...)
{
  if(!inherits(x, "summary.funData"))
    stop("Argument is not of class 'summary.funData'.")
  
  cat("Argument values (@argvals):\n")
  print(x$argvals)
  
  cat("\nObserved functions (@X):\n")
  print(x$X)
  
  cat("\n")
  invisible(x)
}


#' @keywords internal
#' 
#' @export
print.summary.multiFunData <- function(x, ...)
{
  if(!inherits(x, "summary.multiFunData"))
    stop("Argument is not of class 'summary.multiFunData'.")
  
  sapply(seq_len(length(x)), function(i){
    cat("--- Element", i, " ---\n")
    print.summary.funData(x[[i]])})
  
  invisible(x)
}


#' @keywords internal
#' 
#' @export
print.summary.irregFunData <- function(x, ...)
{
  if(!inherits(x, "summary.irregFunData"))
    stop("Argument is not of class 'summary.irregFunData'.")
  
  cat("Argument values (@argvals):\n")
  print(x$argvals)
  
  cat("\nObserved functions (@X):\n")
  print(x$X)

  cat("\n")
  invisible(x)
}