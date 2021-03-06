% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coerce.R
\name{as.data.frame.funData}
\alias{as.data.frame.funData}
\alias{as.data.frame,funData-method}
\alias{as.data.frame,multiFunData-method}
\alias{as.data.frame,irregFunData-method}
\title{Coerce functional data objects to a data.frame}
\usage{
\S4method{as.data.frame}{funData}(x)

\S4method{as.data.frame}{multiFunData}(x)

\S4method{as.data.frame}{irregFunData}(x)
}
\arguments{
\item{x}{The functional data object that is to be transformed to a
\code{data.frame}}
}
\value{
A data frame with columns \code{obs} (gives index/name of
  observed curve), \code{argvals1, ... argvalsd} with \code{d} the
  dimension of the support and \code{X} for the observed values.
  One-dimensional functions have only \code{argvals1}, two-dimensional
  functions (images) have \code{argvals1} and \code{argvals2}, etc.
}
\description{
Coerce objects of class \code{funData},  \code{multiFunData} and
\code{irregFunData} to a data frame.
}
\examples{
# one-dimensional domain
f1 <- funData(argvals = 1:5, X = matrix(1:20, nrow = 4))
head(as.data.frame(f1))

# two-dimensional domain
f2 <- funData(argvals = list(1:5, 1:6), X = array(1:120, c(4,5,6)))
head(as.data.frame(f2))

# multivariate functional data
m1 <- multiFunData(f1, f2)
str(as.data.frame(m1))

# irregular functional data
i1 <- irregFunData(argvals = list(1:5, 2:4, 3:5), X = list(1:5, 2:4, -(3:1)))
head(as.data.frame(i1))
}
\seealso{
\code{\linkS4class{funData}},
  \code{\linkS4class{irregFunData}}, \code{\linkS4class{multiFunData}},
  \code{\link{data.frame}}
}
