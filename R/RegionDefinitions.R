# Class definitions for sequence regions

#' @include Shazam.R
NULL

#### Constants ####

# Region color palette
REGION_PALETTE <-  c("CDR"="#377eb8",
                     "FWR"="#e41a1c",
                     "CDR1"="#ff7f00",
                     "CDR2"="#a65628",
                     "FWR1"="#4daf4a",
                     "FWR2"="#984ea3",
                     "FWR3"="#e41a1c")


#### Classes ####

#' S4 class defining a region definition
#' 
#' \code{RegionDefinition} defines a common data structure for defining the region
#' boundaries of an Ig sequence.
#' 
#' @slot    name            name of the RegionDefinition.
#' @slot    description     description of the model and its source.
#' @slot    boundaries      \code{factor} defining the region boundaries of the 
#'                          sequence. The levels and values of \code{boundaries} 
#'                          determine the number of regions.
#' @slot    seqLength       length of the sequence.
#' @slot    regions         levels of the boundaries; e.g, \code{c("CDR", "FWR")}.
#' @slot    labels          labels for the boundary and mutations combinations;
#'                          e.g., \code{c("CDR_R", "CDR_S", "FWR_R", "FWR_S")}.
#' @slot    citation        publication source.
#' 
#' @seealso
#' See \link{IMGT_SCHEMES} for a set of predefined \code{RegionDefinition} objects.
#'    
#' @name         RegionDefinition-class
#' @rdname       RegionDefinition-class
#' @aliases      RegionDefinition
#' @exportClass  RegionDefinition
setClass("RegionDefinition", 
         slots=c(name="character",
                 description="character",
                 boundaries="factor",
                 seqLength="numeric",
                 regions="character",
                 labels="character",
                 citation="character"),
         prototype=list(name="IMGT_V",
                        description="IMGT_Numbering scheme defining the V gene up to, but not including, CDR3.",
                        boundaries=factor(c(rep("FWR", 78), 
                                            rep("CDR", 36),  
                                            rep("FWR", 51), 
                                            rep("CDR", 30), 
                                            rep("FWR", 117)),
                                          levels=c("CDR","FWR")),
                        seqLength=312,
                        regions=c("CDR", "FWR"),
                        labels=c("CDR_R", "CDR_S", "FWR_R", "FWR_S"),
                        citation="Lefranc MP et al. (2003)"))


#### RegionDefinition building functions #####

#' Creates a RegionDefinition
#' 
#' \code{createRegionDefinition} creates a \code{RegionDefinition}.
#'
#' @param    name           name of the region definition.
#' @param    boundaries     \code{factor} defining the region boundaries of the sequence.
#'                          The levels and values of \code{boundaries} determine the 
#'                          number of regions (e.g. CDR and FWR).
#' @param    description    description of the region definition and its source data.
#' @param    citation       publication source.
#' 
#' @return   A \code{RegionDefinition} object.
#' 
#' @seealso  See \link{RegionDefinition} for the return object.
#' 
#' @examples
#' # Creates an empty RegionDefinition object
#' createRegionDefinition()
#' 
#' @export
createRegionDefinition <- function(name="",
                                   boundaries=factor(),
                                   description="",
                                   citation="") {
    #Extract information from 'boundaries'
    # Determine the number of levels (e.g. CDR, FWR)
    regions <- levels(boundaries)
    # Determine the length of the boundaries
    seqLength <- length(boundaries)
    
    # Determine the combinations of levels_regionDefinition and R/S
    # e.g. CDR_R CDR_S FWR_R, FWR_S
    labels <- paste(rep(regions, each=2), 
                    rep(c("R", "S"), length(regions)), 
                    sep="_")
    
    # Define RegionDefinition object
    regionDefinition <- new("RegionDefinition",
                            name=name,
                            description=description,
                            boundaries=boundaries,
                            seqLength=seqLength,
                            regions=regions,
                            labels=labels,
                            citation=citation)
    
    return(regionDefinition)
}


# Create an empty RegionDefinition object
#
# \code{makeNullRegionDefinition} takes an array of observed mutations 
# and makes an empty RegionDefinition object.
#
# @param   regionLength    Length of the empty 
# 
# @return A \code{RegionDefinition} object
makeNullRegionDefinition <- function(regionLength) {
    rd <- createRegionDefinition(name="",
                                 boundaries=factor(c(rep("SEQ", regionLength)),
                                                    levels = c("SEQ")),
                                 description="",
                                 citation="") 
    return(rd)
}


#### Data ####

#' IMGT unique numbering schemes
#'
#' Sequence region definitions according to the IMGT unique numbering scheme.
#'
#' @format A \link{RegionDefinition} object defining:
#' \itemize{
#'   \item  \code{IMGT_V}:              The IMGT numbered V segment up to position nucleotide 312.
#'                                      This definition combines the CDR1 and CDR2 into a single CDR region,
#'                                      and FWR1, FWR2 and FWR3 into a single FWR region. CDR3 and FWR4 are
#'                                      excluded as they are downstream of nucleotide 312.
#'   \item  \code{IMGT_V_BY_CODONS}:    The IMGT numbered V segment up to position nucleotide 312.
#'                                      This definition treats each codon, from codon 1 to codon 104, as a 
#'                                      distinct region.
#'   \item  \code{IMGT_V_BY_REGIONS}:   The IMGT numbered V segment up to position nucleotide 312.
#'                                      This defines separate regions for each of CDR1, CDR2,
#'                                      FWR1, FWR2 and FWR3. CDR3 and FWR4 are
#'                                      excluded as they are downstream of nucleotide 312.
#'   \item  \code{IMGT_V_BY_SEGMENTS}:  The IMGT numbered V segment up to position nucleotide 312.
#'                                      This definition has no subdivisons and treats the entire V segment
#'                                      as a single region.
#' }
#' 
#' @references
#' \enumerate{
#'   \item  Lefranc MP, et al. IMGT unique numbering for immunoglobulin and T cell 
#'            receptor variable domains and Ig superfamily V-like domains. 
#'            Developmental and comparative immunology. 2003 27:55-77.
#' }
#' 
#' @name   IMGT_SCHEMES
NULL

#' @name    IMGT_V
#' @rdname  IMGT_SCHEMES
NULL

#' @name    IMGT_V_BY_CODONS
#' @rdname  IMGT_SCHEMES
NULL

#' @name    IMGT_V_BY_REGIONS
#' @rdname  IMGT_SCHEMES
NULL

#' @name    IMGT_V_BY_SEGMENTS
#' @rdname  IMGT_SCHEMES
NULL
