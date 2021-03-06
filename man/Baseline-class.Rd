% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Baseline.R
\docType{class}
\name{Baseline-class}
\alias{Baseline-class}
\alias{Baseline}
\alias{plot,Baseline,character-method}
\alias{Baseline-method}
\alias{summary,Baseline-method}
\title{S4 class defining a BASELINe (selection) object}
\usage{
\S4method{plot}{Baseline,character}(x, y, ...)

\S4method{summary}{Baseline}(object, nproc = 1)
}
\arguments{
\item{x}{\code{Baseline} object.}

\item{y}{name of the column in the \code{db} slot of \code{baseline} 
containing primary identifiers.}

\item{...}{arguments to pass to \link{plotBaselineDensity}.}

\item{object}{\code{Baseline} object.}

\item{nproc}{number of cores to distribute the operation over.}
}
\description{
\code{Baseline} defines a common data structure the results of selection
analysis using the BASELINe method.
}
\section{Slots}{

\describe{
\item{\code{description}}{\code{character} providing general information regarding the 
sequences, selection analysis and/or object.}

\item{\code{db}}{\code{data.frame} containing annotation information about 
the sequences and selection results.}

\item{\code{regionDefinition}}{\link{RegionDefinition} object defining the regions
and boundaries of the Ig sequences.}

\item{\code{testStatistic}}{\code{character} indicating the statistical framework 
used to test for selection. For example, \code{"local"} or 
\code{"focused"}.}

\item{\code{regions}}{\code{character} vector defining the regions the BASELINe 
analysis was carried out on. For \code{"CDR"} and \code{"FWR"} 
or \code{"CDR1"}, \code{"CDR2"}, \code{"CDR3"}, etc.}

\item{\code{numbOfSeqs}}{\code{matrix} of dimensions \code{r x c} containing the number of 
sequences or PDFs in each region, where:\cr
\code{r} = number of rows = number of groups or sequences.\cr
\code{c} = number of columns = number of regions.}

\item{\code{binomK}}{\code{matrix} of dimensions \code{r x c} containing the number of 
successes in the binomial trials in each region, where:\cr
\code{r} = number of rows = number of groups or sequences.\cr
\code{c} = number of columns = number of regions.}

\item{\code{binomN}}{\code{matrix} of dimensions \code{r x c} containing the total 
number of trials in the binomial in each region, where:\cr
\code{r} = number of rows = number of groups or sequences.\cr
\code{c} = number of columns = number of regions.}

\item{\code{binomP}}{\code{matrix} of dimensions \code{r x c} containing the probability 
of success in one binomial trial in each region, where:\cr
\code{r} = number of rows = number of groups or sequences.\cr
\code{c} = number of columns = number of regions.}

\item{\code{pdfs}}{\code{list} of matrices containing PDFs with one item for each 
defined region (e.g. "CDR" and "FWR"). Matrices have dimensions
\code{r x c} dementions, where:\cr
\code{r} = number of rows = number of sequences or groups. \cr
\code{c} = number of columns = length of the PDF (default 4001).}

\item{\code{stats}}{\code{data.frame} of BASELINe statistics, 
including: mean selection strength (mean Sigma), 95\% confidence 
intervals, and p-values with positive signs for the presence of 
positive selection and/or p-values with negative signs for the
presence of negative selection.}
}}

\seealso{
See \link{summarizeBaseline} for more information on \code{@stats}.
}
