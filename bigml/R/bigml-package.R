#' R bindings for BigML API
#'
#' \tabular{ll}{
#' Package: \tab bigml\cr
#' Type: \tab Package\cr
#' Version: \tab 0.1\cr
#' Date: \tab 20012-04-30\cr
#' License: \tab GPL (>= 2)\cr
#' LazyLoad: \tab yes\cr
#' }
#'
#' A set of methods that enable straightforward usage of the BigML API.
#' The methods use R idioms and native datatypes where appropriate, while
#' also providing access to more conventional API usage.
#'
#'
#' @name bigml-package
#' @aliases bigml
#' @docType package
#' @author Justin Donaldson \email{donaldson@@bigml.com}
#' @keywords package 
#' @examples 
#' \dontrun{
#' 	# set default credentials
#' 	setBigmlCredentials('username', 'key')
#' 	model = quickBigMLModel(iris, 'Species')
#' 	quickBigMLPrediction(model, c(Petal.Width=0.2, Petal.Length=1.4))
#'
#' 	# use specific credentials
#' 	quickBigMLPrediction(model, c(Petal.Width=0.2, Petal.Length=1.4), username='someuser', api_key='somekey')
#'  
#'	# list most recent sources
#'  listBigMLSources()
#'
#' 	# specify limit and offset
#'  listBigMLModels(limit=15,offset=300)
#'
#'	# specify filter criteria
#'  listBigMLDatasets(size__gt=1048576)
#' }
NULL