% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_to_dwca.R
\name{convert_to_dwca}
\alias{convert_to_dwca}
\title{Convert a dataset to the Darwin Core Archive format}
\usage{
convert_to_dwca(
  path,
  core_name,
  source_id,
  derived_id,
  url = NULL,
  user_id,
  user_domain
)
}
\arguments{
\item{path}{(character) Path to which the DwC-A data objects and EML will be written.}

\item{core_name}{(character) The central table of the DwC-A dataset being created. Can be: "event" (event core). Occurrence core is not yet supported.}

\item{source_id}{(character) Identifier of an ecocomDP dataset published in a supported repository. Currently, the EDI Data Repository is supported.}

\item{derived_id}{(character) Identifier of the DwC-A dataset being created.}

\item{url}{(character) URL to the publicly accessible directory containing DwC-A data objects. This argument supports direct download of the data entities by a data repository and is used for automated revisioning and publication.}

\item{user_id}{(character) Identifier of user account associated with the data repository in which this ecocomDP dataset will be archived. Only \code{user_id} from the EDI is currently supported.}

\item{user_domain}{(character) Domain (data repository) the \code{user_id} belongs to. Currently, EDI is supported.}
}
\value{
DwC-A tables, meta.xml, and corresponding EML metadata.
}
\description{
Convert a dataset to the Darwin Core Archive format
}
\details{
Reads in an ecocomDP dataset from a supported repository and converts it to a DwC-A package.
}
\examples{
\dontrun{
# Create directory for DwC-A outputs
mypath <- paste0(tempdir(), "/data")
dir.create(mypath)

# Convert an EDI published ecocomDP dataset to a DwC-A
convert_to_dwca(
  path = mypath, 
  core_name = "event", 
  source_id = "edi.193.5", 
  derived_id = "edi.834.2", 
  user_id = "ecocomdp",
  user_domain = "EDI")

dir(mypath)

# Clean up
unlink(mypath, recursive = TRUE)
}

}
