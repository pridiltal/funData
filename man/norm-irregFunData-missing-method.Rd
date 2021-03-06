% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funDataMethods.R
\name{norm,irregFunData,missing-method}
\alias{norm,irregFunData,missing-method}
\title{Calculate the norm for irregular functional data}
\usage{
\S4method{norm}{irregFunData,missing}(
  x,
  squared = TRUE,
  obs = seq_len(nObs(x)),
  method = "trapezoidal",
  weight = 1,
  fullDom = FALSE
)
}
\description{
Calculate the norm for irregular functional data
}
\seealso{
\code{\link{norm}}, \code{\linkS4class{irregFunData}}
}
\keyword{internal}
