\name{posteriorobs}
\alias{posteriorobs}
\title{
	posterior mean and covariance at observation times
}
\description{
	Internal function. Finds the posterior mean and covariance at the observation times \code{tobs}, for every subject; see Section 2 of the referenced article for further details.
}
\usage{
	posteriorobs(Sigma0inv, sigma, muprior, Xtilda, tobs, YI)
}
\arguments{
	\item{Sigma0inv}{
		Prior precision matrix at the observation times \code{tobs}.
	}
	\item{sigma}{
		Infinitessimal standard deviation of the tied-down Brownian motion in the prior. 
	}
	\item{muprior}{
		Prior mean at the observation times \code{tobs}.
	}
	\item{Xtilda}{
		An n by N matrix with columns given by the values of \bold{y} for the N subjects.
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
	\item{YI}{
		An N times (n-1) matrix with rows given by the values of \eqn{y_i, i=1\ldots, n-1} for the N subjects.
	}
}
