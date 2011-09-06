\name{priormeanobs}
\alias{priormeanobs}
\title{
	prior mean
}
\description{
	Internal function. Finds the sample mean of the n-vector \bold{y} for use in specifying the prior mean \eqn{{\boldsymbol\mu}_0}; see Section 2 of the referenced article for further details.
}
\usage{
	priormeanobs(YI, tobs)
}
\arguments{
	\item{YI}{
		The N times (n-1) matrix with rows being the values of \eqn{y_i, i=1\ldots, n-1} for the N subjects
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
}

