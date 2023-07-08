\name{fill_rate}
\alias{fill_rate}
\alias{show_rate}
\title{
Fill Rate/Show Rate
}
\description{
A percentage of returned ads that were displayed in the app to the user out of all requested ones.
}
\usage{
fill_rate(data)
}
\arguments{
  \item{data}{
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Requests' and 'Impressions'.
}
}
\value{
A ratio of impressions to requests as a percentage.
}

\author{
Ivan Nemtsev
}
\note{
Dataset has to be named 'data' and include columns 'Requests' and 'Impressions'.
}
\examples{
## The function is currently defined as
fill_rate <- function(data){
  x <- data$Requests
  y <- data$Impressions
  round(
    y/x*100,
    digits=2)
}

## Example of use:
data <- data.frame(
  Date = c("2022-07-01", "2022-07-02", "2022-07-03", "2022-07-29", "2022-07-30", "2022-07-31"),
  Block = c("1_234", "1_234", "1_234", "1_235", "1_235", "1_235"),
  Requests = c(372234, 268816, 291224, 1928854, 1928290, 786539),
  Impressions = c(18537, 12432, 13764, 2839269, 2682648, 1114773),
  Revenue = c(13.5, 9.13, 8.85, 1669.0, 1654.0, 739.0),
  Clicks = c(1167, 720, 856, 214451, 196657, 93178),
  Viewable = c(13320, 8214, 9768, 2446884, 2243865, 1063158)
)
data$FillRate <- fill_rate(data)
  }

\keyword{ manip }
\keyword{ arith }
\keyword{ math }
\concept{ FillRate }
\concept{ ShowRate }
\concept{ metrics }
\concept{ ratio }
\concept{ impressions }
\concept{ requests }


