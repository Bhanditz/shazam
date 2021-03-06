% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TargetingModels.R
\name{makeAverage1merMut}
\alias{makeAverage1merMut}
\title{Make a 1-mer mutability model by averaging over a 5-mer mutability model}
\usage{
makeAverage1merMut(mut5mer)
}
\arguments{
\item{mut5mer}{a named vector of length 1024 such as that returned by 
\code{createMutabilityMatrix} and that returned by
\code{makeDegenerate5merMut} with \code{extended=FALSE}.
Names should correspond to 5-mers made up of "A", "T", 
"G", and "C" (case-insensitive). \code{NA} values are 
allowed.}
}
\value{
A named vector of length 4 containing normalized mutability rates.
}
\description{
\code{makeAverage1merMut} averages mutability rates in a 5-mer mutability model
to derive a 1-mer mutability model.
}
\details{
For example, the mutability rate of "A" in the resultant 1-mer model
          is derived by averaging the mutability rates of all the 5-mers that 
          have an "A" as their central 1-mer, followed by normalization.
}
\examples{
# Make a degenerate 5-mer model (length of 1024) based on a 1-mer model
example1merMut <- c(A=0.2, T=0.1, C=0.4, G=0.3)
degenerate5merMut <- makeDegenerate5merMut(mut1mer = example1merMut)
 
# Now make a 1-mer model by averaging over the degenerate 5-mer model
# Expected to get back example1merMut
makeAverage1merMut(mut5mer = degenerate5merMut)

}
\seealso{
See \link{makeDegenerate5merMut} for making a degenerate 5-mer mutability
          model based on a 1-mer mutability model.
}
