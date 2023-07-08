\name{CTR}
\alias{CTR}
\title{
Clickthrough rate
}
\description{
A ratio showing how often people who see your ad end up clicking on it.
}
\usage{
CTR(data)
}
\arguments{
  \item{data}{
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Impressions' and 'Clicks'.
}
}
\value{
A ratio of clicks to impressions.
}

\author{
Ivan Nemtsev
}
\note{
Dataset has to be named 'data' and include columns 'Impressions' and 'Clicks'.
}
\examples{
## The function is currently defined as
CTR <- function(data){
  x <- data$Impressions
  y <- data$Clicks
  round(
    y/x,
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
data$CTR <- CTR(data)
  }

\keyword{ manip }
\keyword{ arith }
\keyword{ math }
\concept{ CTR }
\concept{ metrics }
\concept{ ratio }
\concept{ clicks }
\concept{ impressions }

