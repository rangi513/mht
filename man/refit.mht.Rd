\name{refit.mht}
\alias{refit}
\alias{refit.mht}
\title{
Refit a \code{mht} object}
\description{
Refit a \code{mht} object for a new observation Ynew}
\usage{
\method{refit}{mht}(object,Ynew,var_nonselect,sigma,maxordre,ordre,m,show,IT,maxq,\dots)
}

\arguments{
\item{object}{Object of class "mht".}
\item{Ynew}{Response variable of length n.}
\item{var_nonselect}{Number of variables that don't undergo feature selection. They have to be in the first columns of data. Default is 1, the selection is not performed on the intercept.}
\item{sigma}{Value of the variance if it is known; 0 otherwise. Default is 0.}
\item{maxordre}{Number of variables to order. Default is min(n-1,p-1).}
\item{ordre}{Three possible algorithms to order the variables, ordre=c("bolasso","pval","pval_hd"). "bolasso" uses the dyadic algorithm with the Bolasso, "pval" use the p-values obtained with a regression on the full set of variables (only when p<n), the last "pval_hd" makes regression on one variable at a time. Default is "bolasso".}
\item{m}{Number of bootstrapped iteration of the Lasso. Only use if the algorithm is set to "bolasso". Default is m=100.}
\item{show}{Vector of logical values, show=(showordre,showtest,showresult). Default is (1,0,1). If showordre==TRUE, show the ordered variables at each step of the algorithm.
If showtest==TRUE, show the number of regularization parameters tested to show the advancement of the dyadic algorithm. Only use if the algorithm is set to "bolasso". 
if showresult==TRUE, show the value of the statistics and the estimated quantile at each step of the procedure.} 
\item{IT}{Number of simulations in the calculation of the quantile. Default is 20000.}
\item{maxq}{Number of maximum multiple hypotheses testing to do. Default is log(min(n,p)-1,2).}
\item{\dots}{not used.}
}


\details{see \code{\link{mht}} for details.
}

\value{A 'mht' object is returned.
\item{data}{List of the user-data: the scaled matrix used in the algorithm and Y.}
\item{coefficients}{Matrix of the estimated coefficients. Each row concerns a specific user level \code{alpha}.}
\item{relevant_var}{Set of the relevant variables for each \code{alpha}.}
\item{fitted.values}{Matrix of the fitted values, each column concerns a specific user level \code{alpha}.}
\item{ordre}{Order obtained on the \code{maxordre} variable.}
\item{ordrebeta}{The full order on all the p variables.}
\item{kchap}{Vector containing the length of the estimated set of relevant variables, for the matrix containing the intercept, for each values of \code{alpha}.}
\item{quantile}{The estimated quantiles used in the second step of the procedure.}
\item{call}{The call that has been used.}
\item{call.old}{The call that produced the initial 'object'.}
}

\examples{
\dontrun{
x=matrix(rnorm(100*20),100,20)
beta=c(rep(2,5),rep(0,15))
y=x\%*\%beta+rnorm(100)
ynew=x\%*\%beta+rnorm(100)
mod=mht(x,y,alpha=c(0.1,0.05),maxordre=15)
mod2=refit(mod,ynew,maxordre=15)
}
}