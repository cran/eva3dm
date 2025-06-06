% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io_stats.R
\name{write_stat}
\alias{write_stat}
\title{Functions to write stats and evaluation}
\usage{
write_stat(stat, file, sep = ";", dec = ".", verbose = FALSE, ...)
}
\arguments{
\item{stat}{observed data.frame}

\item{file}{model data.frame}

\item{sep}{the field separator string, passed to write.table function}

\item{dec}{he string to use for decimal points, passed to write.table function}

\item{verbose}{display additional information}

\item{...}{arguments passed to write.table and write.csv functions}
}
\value{
No return value
}
\description{
Functions to write the output from evaluation functions. If the file name ends with .csv
the function write.csv is used otherwise the function write.table is used.
}
\examples{

sample <- read_stat(paste0(system.file("extdata", package = "eva3dm"),"/sample.csv"),
                    verbose = TRUE)
dir.create(file.path(tempdir(), "stats"))

write_stat(file    = paste0(file.path(tempdir(), "stats"),'/sample.txt'),
           stat    = sample,
           verbose = TRUE)

write_stat(file    = paste0(file.path(tempdir(), "stats"),'/sample.csv'),
           stat    = sample,
           verbose = TRUE)

}
