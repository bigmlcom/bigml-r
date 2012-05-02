#' Listing BigML Datasets
#' @export 
#' @param flatten A logical value indicating whether to flatten the response
#'	into a data frame.
#' @param models_only A logical value indicating whether to only return 
#'	the data frame of model information (only valid if \code{flatten} is 
#'	\code{TRUE}).
#' @template dots
#' @template author
listBigMLModels <-
function (flatten = TRUE, models_only = TRUE, ...) 
{
    response = .basic_api(.MODEL_URL)$list(...)
    if (flatten) {
        response$objects = ldply(response$objects, function(x) {
            as.data.frame(Filter(function(y) length(y) == 1, 
                x))
        })
    }
    if (models_only) {
        response = response$objects
    }
    response
}
