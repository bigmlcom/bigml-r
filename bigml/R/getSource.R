#' Retrieving a BigML Source
#' @export 
#' @templateVar family_name source
#' @template family
#' @param source_id A character value giving the name of the source.
#' @param flatten A logical value indicating whether to flatten the response 
#'	into a data frame.
#' @template dots
#' @template author
#' @template source_return
getSource <-
function (source_id, flatten = TRUE) 
{
    response = .basic_api(.SOURCE_URL)$get(source_id)
    if (flatten) {
        response$fields = ldply(response$fields, function(x) {
            data.frame(x, stringsAsFactors=FALSE)
        })
    }
    return(response)
}
