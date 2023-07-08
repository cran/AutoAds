\name{CPMv}
\alias{CPMv}
\title{
Cost per thousand viewable impressions
}
\description{
Calculating CPMv based on Viewable Impressions and Revenue data. The dataset has to be named 'data' and include columns 'Viewable' and 'Revenue'.
}
\usage{
CPMv(data)
}
\arguments{
  \item{data}{
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Viewable' and 'Revenue'.
}
}
\value{
Cost per thousand viewable impressions of an ad, shown in the currency the original file had for 'Revenue'.
}

\author{
Ivan Nemtsev
}
\note{
Dataset has to be named 'data' and include columns 'Viewable' and 'Revenue'.
}
\examples{
## The function is currently defined as
CPMv <- function(data){
  x <- data$Viewable
  y <- data$Revenue
  round(
    y/x*1000,
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
data$CPMv <- CPMv(data)
  }

\keyword{ manip }
\keyword{ arith }
\keyword{ math }
\concept{ CPMv }
\concept{ CPM }
\concept{ metrics }
\concept{ viewable }
\concept{ revenue }

