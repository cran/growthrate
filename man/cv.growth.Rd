\name{cv.growth}
\alias{cv.growth}
\title{
	cross validation error 
}
\description{
	Computes the cross validation error resulting from the removal of the data at a given interior observation time as a function of the infinitessimal standard deviation \code{sigma} on a grid of \code{k} equispaced values in the interval [\code{a}, \code{b}].
}
\usage{
	cv.growth(data, tobs, d, K, a, b, r) 
}
\arguments{
	\item{data}{
		Input matrix of size N (subjects) times n (observation times). Each column  contains the heights (of all subjects) at a given observation time, each row contains the heights (at the observation times) for a given subject.
	}
	\item{tobs}{
		Row vector of n observation times (in increasing order, same for each subject).
	}
	\item{d}{
		Number of points on the fine time-grid (between the first and last observation times in \code{tobs}) at which the posterior means and covariances are computed.
	}
	\item{K}{
		Number of points on the grid for \code{sigma}.
	}
	\item{a}{
		Minimum value for \code{sigma} (positive).
	}
	\item{b}{
		Maximum value for \code{sigma} (strictly larger than \code{a}).
	}
	\item{r}{
		Index of the interior observation time in \code{tobs} removed in the cross-validation.
	}
}
\details{
	The data for the \code{r}th observation time (for a given \eqn{1 <} \code{r} \eqn{< n}) are removed and the mean squared error of the reconstructed data at that time point computed over the grid for \code{sigma}.  
}
\value{
	\item{sigmavec}{
		\code{K}-vector of \code{sigma}-values considered in the cross validation.
	}
	\item{CVer}{
		Cross validation error at each value of \code{sigma} in \code{sigmavec}.
	}
}
\references{
	Lopez-Pintado, S. and McKeague, I. W. (2013).
	\emph{Recovering gradients from sparsely observed functional
	  data.} Biometrics 69, 396-404 (2013).
	http://www.columbia.edu/~im2131/ps/growthrate-package-reference.pdf
}
\author{
	Sara Lopez-Pintado and Ian W. McKeague

	Maintainer:  Ian W. McKeague <im2131@columbia.edu>
}
\examples{
\dontrun{
    ## example using the height data provided in the package
    ## there are 7 observation times (age in years):
    ## WARNING: cv.growth is time-consuming. This example uses only part of the data.
    data(height_data);
    ht = height_data[1:100,];
    tobs=c(0,1/3,2/3,1,3,4,7);
    cvg=cv.growth(ht, tobs, 100, 21, 1, 5, 2);

    ## Plot of the cross validation error as a function of sigma:
    plot(cvg$sigmavec, cvg$CVer, xlab="Sigma", ylab="Cross validation error");

    ## Value of sigma that minimizes the cross validation error:
    sigmaopt=cvg$sigmavec[which(cvg$CVer==min(cvg$CVer))]; 	
}
}

