\name{growth}
\alias{growth}
\title{recovery of growth velocities 
}
\description{
	Computes the mean function and covariance kernel (over a fine grid of equispaced time points) of the posterior growth velocity  for each subject, based on growth data (e.g., heights) at fixed observation times.
}
\usage{
	growth(data, tobs, sigma, d)
}
\arguments{
	\item{data}{
		Input matrix of size N (subjects) times n (observation times). Each column  contains the heights (of all subjects) at a given observation time, each row contains the heights (at the observation times) for a given subject.
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
	\item{sigma}{
		A positive scalar representing the infinitessimal standard deviation of the tied-down Brownian motion in the prior. Can be selected by cross-validation.
	}
	\item{d}{
		Number of time points on the fine grid.
	}
}
\details{
	The Bayesian reconstruction implemented here uses a prior growth velocity model that is specified by a general multivariate normal distribution at the n fixed observation times, and a tied-down Brownian motion (having  infinitessimal standard deviation specified by \code{sigma}) between the observation times.

	The prior mean and prior precision matrix at the observation times are estimated using the data on N subjects. Clime (constrained L1 minimization) provides the estimate of the prior precision matrix, with the clime constraint parameter lambda selected by 5-fold cross validation using the likelihood loss function.
}
\value{
	\item{muhatcurve}{
		Posterior means of the growth velocities (for each subject) on the fine grid \code{tgrid}.  An N (subjects) times \code{d} matrix.
	}
	\item{Khat}{
		Posterior covariance kernel of the growth velocities on the fine grid \code{tgrid}. A \code{d} times \code{d} matrix (the same for every subject).
	}
	\item{tgrid}{
		The fine grid of \code{d} equispaced-time points (between the first and last observation times in \code{tobs}) at which the posterior means and covariances are computed.
	}
}
\references{
	Lopez-Pintado, S. and McKeague, I. W. (2011).
	\emph{Recovering gradients from sparsely observed functional data.}  Preprint, submitted to \emph{Biometrics}.
	http://www.columbia.edu/~im2131/ps/growthrate-package-reference.pdf
}
\author{
	Sara Lopez-Pintado and Ian W. McKeague

	Maintainer:  Yang Hu <yyh2106@caa.columbia.edu>
}
\examples{
\dontrun{
## example using the height data provided in the package
## there are 7 observation times (age in years):
	data(height_data);
	tobs=c(0,1/3,2/3,1,3,4,7);
	d=200;
	sigma=1;
	g=growth(height_data,tobs,sigma,d);

## Plot of the posterior mean and credible interval for a specific individual
	indiv=1;
## posterior standard deviation (same for all subjects):
	postsd=sqrt(diag(g$Khat));
	plot(g$tgrid,g$muhatcurve[indiv,],type='l',
			xlab="Age (years)",ylab="Growth velocity (cms/year)");
	lines(g$tgrid,g$muhatcurve[indiv,]);
	lines(g$tgrid,g$muhatcurve[indiv,]+2*postsd,lty=2);
	lines(g$tgrid,g$muhatcurve[indiv,]-2*postsd,lty=2);

## Plot of a draw from the posterior growth velocity for a specific individual:
	draw=rmvnorm(n=1, mean=g$muhatcurve[indiv,], sigma=g$Khat, method="chol");
	plot(g$tgrid,draw,type='l',xlab="Age (years)",ylab="Growth
	velocity (cms/year)");
}
}
\keyword{main program}

