\name{adstats}
\alias{adstats}
\title{
All metrics
}
\description{
A combination of functions view_percent, eCPM, CPMv, CTR, and fill_rate in one.
}
\usage{
adstats(data)
}
\arguments{
  \item{data}{A dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Requests', 'Impressions', 'Revenue', 'Viewable', and 'Clicks'.}
}
\value{
\item{view_percent}{A percentage of viewable impressions among the total number of impressions.}
\item{eCPM}{Cost per thousand impressions of an ad, shown in the currency the original file had for 'Revenue'.}
\item{CPMv}{Cost per thousand viewable impressions of an ad, shown in the currency the original file had for 'Revenue'.}
\item{CTR}{A ratio of clicks to impressions.}
\item{fill_rate}{A ratio of impressions to requests as a percentage.}
}

\author{
Ivan Nemtsev
}
\note{
Dataset downloaded from excel file, has to be assigned to 'data' and include columns 'Requests', 'Impressions', 'Revenue', 'Viewable', and 'Clicks'.
}
\examples{
## The function is currently defined as
adstats <- function(data){
  data$ViewablePercent <- view_percent(data)
  data$eCPM <- eCPM(data)
  data$CPMv <- CPMv(data)
  data$CTR <- CTR(data)
  data$FillRate <- fill_rate(data)
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
data <- adstats(data)
  }

\keyword{ manip }
\keyword{ arith }
\keyword{ math }
\concept{ viewable }
\concept{ impressions }
\concept{ percent }
\concept{ metrics }
\concept{ eCPM }
\concept{ CPM }
\concept{ CPMv }
\concept{ revenue }
\concept{ ratio }
\concept{ clicks }
\concept{ FillRate }
\concept{ ShowRate }
\concept{ requests }


