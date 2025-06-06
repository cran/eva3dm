% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select.R
\name{select}
\alias{select}
\title{Selection from data.frames with time-series}
\usage{
select(
  data,
  year,
  month,
  day,
  hour,
  minutes,
  seconds,
  start,
  end,
  range,
  time = "date"
)
}
\arguments{
\item{data}{data.frame with model or observation data}

\item{year}{numeric vector for selection}

\item{month}{numeric vector (1-12) for selection, can be abbreviated to 3 or more letters}

\item{day}{numeric vector (1-31) for selection, weekdays can be abbreviated to 3 or more letters, or weekday/weekend}

\item{hour}{numeric vector (0-23) for selection}

\item{minutes}{numeric vector (0-60) for selection}

\item{seconds}{numeric vector (0-60) for selection}

\item{start}{POSIXct or character (YYYY-MM-DD) with the initial date of selection}

\item{end}{POSIXct or character (YYYY-MM-DD) with the initial date of selection}

\item{range}{pair of start/end or a data.frame with time (default is "date")}

\item{time}{name of the column for time (default is "date")}
}
\value{
data.frame
}
\description{
Utility function to select periods from a data.frame. This function is inspired by openair::selectByDate.
}
\examples{
model <- readRDS(paste0(system.file("extdata",package="eva3dm"),
                        "/model.Rds"))
summary(model)
summary(select(data = model, start = '2012-01-09'))
summary(select(data = model, start = '2012-01-05', end  = '2012-01-09'))
summary(select(data = model, day  = 6))
summary(select(data = model, hour = 12))
summary(select(data = model, day = 6, hour = 12))
summary(select(data = model, day  = 'weekday'))
summary(select(data = model, day  = 'weekend'))
summary(select(data = model, day  = 'tue'))
summary(select(data = model, day  = 'jan'))
}
\seealso{
See \code{\link[eva3dm]{\%IN\%}} for selection based on position and model domains.
}
