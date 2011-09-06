\name{Khatf}
\alias{Khatf}
\title{
	posterior covariance kernel
}
\description{
	Internal function. Finds the posterior covariance kernel on the fine grid \code{tgrid} (same for every subject); see Section 2 of the referenced article for further details.
}
\usage{
	Khatf(tgrid, tobs, sigma, Sigmahat)
}
\arguments{
	\item{tgrid}{
		The fine grid of \code{d} equispaced-time points (between the first and last observation times in \code{tobs}) at which the posterior means and covariances are computed.
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
	\item{sigma}{
		Infinitessimal standard deviation of the tied-down Brownian motion in the prior.
	}
	\item{Sigmahat}{
		Posterior covariance at the observation times \code{tobs} (same for every subject).
	}
}
