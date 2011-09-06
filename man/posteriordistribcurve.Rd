\name{posteriordistribcurve}
\alias{posteriordistribcurve}
\title{
	posterior mean
}
\description{
	Internal function. Finds the posterior mean on the fine grid  \code{tgrid} for every subject.
}
\usage{
	posteriordistribcurve(muhatmatrix, Sigmahat, sigma, tobs, d, YI)
}
\arguments{
	\item{muhatmatrix}{
		Posterior mean at the observation times \code{tobs} obtained from \code{posteriorobs}.
	}
	\item{Sigmahat}{
		Posterior covariance at the observation times \code{tobs} obtained from \code{posteriorobs}.
	}
	\item{sigma}{
		Infinitessimal standard deviation of the tied-down Brownian motion in the prior.
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
	\item{d}{
		Number of time points on the fine grid.
	}
	\item{YI}{
		An N times (n-1) matrix with rows given by the values of \eqn{y_i, i=1\ldots, n-1} for the N subjects.
	}
}
