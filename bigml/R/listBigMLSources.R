#' Listing BigML Sources
#' @export 
#' @param flatten A logical value indicating whether to flatten the response
#'	into a dataframe.
#' @param sources_only A logical value indicating whether to only return 
#'	the data frame of source information (only valid if \code{flatten} is 
#'	\code{TRUE}).
#' @param \dots Arbitrary named arguments that are passed on to 
#'	\code{\link{formEncodeURL}} in order to create form-encoded URL options 
#'	(see examples).
listBigMLSources <-
function (flatten = TRUE, sources_only = TRUE, 
    ...) 
{
    response = .basic_api(.SOURCE_URL)$list(...)
    if (flatten) {
        response$sources = ldply(response$objects, function(x) {
            x$fields = NULL
            x$source_parser$missing_tokens = paste(x$source_parser$missing_tokens, 
                collapse = ",")
            as.data.frame(unlist(x, recursive = F))
        })
        response$fields = ldply(response$objects, function(y) {
            ldply(y$fields, function(z) {
                z$resource = y$resource
                data.frame(z)
            })
        })
        response$objects = NULL
        if (sources_only) {
            response = response$sources
        }
    }
    return(response)
}
