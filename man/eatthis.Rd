% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eatthis.R
\name{eatthis}
\alias{eatthis}
\title{eatthis}
\usage{
eatthis(dat, cat = NULL, seed = 1)
}
\arguments{
\item{dat}{a dataframe of food items and categories}

\item{cat}{a category}

\item{seed}{a random seed}
}
\value{
Returns a randomly selected foot item
}
\description{
eatthis
}
\examples{
eatthis(dat = eatthis_data)
eatthis(dat = eatthis_data, cat = "Lunch or Dinner")
}
