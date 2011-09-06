\name{new.growth}
\alias{new.growth}
\title{
	recovery of growth velocity for a new subject
}
\description{
	Computes the posterior mean and covariance kernel for a new subject having data at observation times \code{newtobs} different from \code{tobs} (apart from the first and the last). \code{growth} needs to be run first.
}
\usage{
	new.growth(newdata, newtobs, sigma, d, muhatcurve, Khat, tgrid) 
}
\arguments{
	\item{newdata}{
		Row vector of p heights for the new subject.
	}
	\item{newtobs}{
		Row vector of p observation times for the new subject (in increasing order; must include the first and last time points in \code{tobs}).
	}
	\item{sigma}{
		Infinitessimal standard deviation of the Brownian motion prior (same as in \code{growth}).
	}
	\item{d}{
		Number of time points on the fine grid.
	}
	\item{muhatcurve}{
		Output from \code{growth}.
	}
	\item{Khat}{
		Output from \code{growth}.
	}
	\item{tgrid}{
		The fine grid (output from \code{growth}).
	}	
}
\value{
	\item{muhatcurvenew}{
		Posterior mean (on  \code{tgrid}) for the new subject. 
	}
	\item{Khatnew}{
		Posterior covariance kernel (on \code{tgrid}) for the new subject.
	}
}
\references{
	Lopez-Pintado, S. and McKeague, I. W. (2011).
	\emph{Recovering gradients from sparsely observed functional data.}  Preprint, submitted to \emph{Biometrics}.
	http://www.columbia.edu/~im2131/ps/growthrate-package-reference.pdf
}
\author{
	Sara Lopez-Pintado and Ian W. McKeague

	Maintainer:  Yang Hu <mk.yanghu@gmail.com>
}
\examples{
## example using the height data provided in the package 
##    (after first running growth to obtain the output g):
## suppose a new subject has 5 observation times (including 0 and 7)
	data(height_data);
	tobs=c(0,1/3,2/3,1,3,4,7);
	d=200;
	sigma=1;
	g=growth(height_data,tobs,sigma,d);

	newtobs=c(0, 2, 3, 5, 7);
	newdata=t(as.vector(c(50,70,87,100,115)));
	ng=new.growth(newdata,newtobs,sigma,d,g$muhatcurve,g$Khat,g$tgrid);

## plot of the posterior mean growth velocity for the new subject:
	plot(g$tgrid,ng$muhatcurvenew,xlab="Age (years)",ylab="Growth velocity (cms/year)");
}

