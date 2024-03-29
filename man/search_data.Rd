% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_data.R
\name{search_data}
\alias{search_data}
\title{Search published data}
\usage{
search_data(text, taxa, num_taxa, num_years, sd_years, area, boolean = "AND")
}
\arguments{
\item{text}{(character) Text to search for in dataset titles, descriptions, and abstracts. Datasets matching any exact words or phrase will be returned. Can be a regular expression as used by \code{stringr::str_detect()}. Is not case sensitive. Works with \code{boolean}.}

\item{taxa}{(character) Taxonomic names to search on. To effectively search the taxonomic tree, it is advisable to start with specific taxonomic names and then gradually broaden the search to higher rank levels when needed. For instance, if searching for "Astragalus gracilis" (species) doesn't produce any results, try expanding the search to "Astragalus" (Genus), "Fabaceae" (Family), and so on. This approach accounts for variations in organism identification, ensuring a more comprehensive exploration of the taxonomic hierarchy.}

\item{num_taxa}{(numeric) Minimum and maximum number of taxa the dataset should contain. Any datasets within this range will be returned.}

\item{num_years}{(numeric) Minimum and maximum number of years sampled the dataset should contain. Any datasets within this range will be returned.}

\item{sd_years}{(numeric) Minimum and maximum standard deviation between survey dates (in years). Any datasets within this range will be returned.}

\item{area}{(numeric) Bounding coordinates within which the data should originate. Accepted values are in decimal degrees and in the order: North, East, South, West. Any datasets with overlapping areas or contained points will be returned.}

\item{boolean}{(character) Boolean operator to use when searching \code{text} and \code{taxa}. Supported operators are: "AND", "OR". Default is "AND". Note, other parameters used in a search are combined with an implicit "AND".}
}
\value{
(tbl_df, tbl, data.frame) Search results with these feilds:
    \itemize{
        \item source - Source from which the dataset originates. Currently supported are "EDI" and "NEON".
        \item id - Identifier of the dataset.
        \item title - Title of the dataset.
        \item description - Description of dataset. Only returned for NEON datasets.
        \item abstract - Abstract of dataset.
        \item years - Number of years sampled.
        \item sampling_interval - Standard deviation between sampling events in years.
        \item sites - Sites names or abbreviations. Only returned for NEON datasets.
        \item url - URL to dataset.
        \item source_id - Identifier of source L0 dataset.
        \item source_id_url - URL to source L0 dataset.
    }
}
\description{
Search published data
}
\details{
Currently, to accommodate multiple L1 versions of NEON data products, search results for a NEON L0 will also list all the L1 versions available for the match. This method is based on the assumption that the summary data among L1 versions is the same, which may need to be addressed in the future. A list of L0 and corresponding L1 identifiers are listed in /inst/L1_versions.txt. Each L1 version is accompanied by qualifying text that's appended to the title, abstract, and descriptions for comprehension of the differences among L1 versions.
}
\note{
This function may not work between 01:00 - 03:00 UTC on Wednesdays due to regular maintenance of the EDI Data Repository.
}
\examples{
\dontrun{
# Empty search returns all available datasets
search_data()

# "text" searches titles, descriptions, and abstracts
search_data(text = "Lake")

# "taxa" searches taxonomic ranks for a match
search_data(taxa = "Plantae")

# "num_years" searches the number of years sampled
search_data(num_years = c(10, 20))

# Use any combination of search fields to find the data you're looking for
search_data(
  text = c("Lake", "River"),
  taxa = c("Plantae", "Animalia"),
  num_taxa = c(0, 10),
  num_years = c(10, 100),
  sd_years = c(.01, 100),
  area = c(47.1, -86.7, 42.5, -92),
  boolean = "OR")
}

}
