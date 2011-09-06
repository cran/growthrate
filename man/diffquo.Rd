\name{diffquo}
\alias{diffquo}
\title{
	converts height data into difference quotients
}
\description{
	Internal function. Calculates the crude one-sided difference quotients and the second-order difference quotients based on the height data and the observed time points.  
}
\usage{
	diffquo(data, tobs) 
}
\arguments{
	\item{data}{
		As in \code{growth}.
	}
	\item{tobs}{
		As in \code{growth}.
	}
}
\value{
	\item{YI}{
		An N times (n-1) matrix with rows given by the values of the one-sided difference quotients \eqn{y_i, i=1\ldots, n-1} for the N subjects.
	}
	\item{Xtilda}{
		An n by N matrix with columns given by the values of the second-order difference quotients \bold{y} for the N subjects.
	}
}

