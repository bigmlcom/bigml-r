#' Retrieving a BigML Source
#' @export 
#' @param source_id A character value giving the name of the source.
#' @param flatten A logical value indicating whether to flatten the response 
#'	into a data frame.
#' @template dots
#' @template author
getBigMLSource <-
function (source_id, flatten = TRUE) 
{
    response = .basic_api(.SOURCE_URL)$get(id)
    if (flatten) {
        response$fields = ldply(response$fields, function(x) {
            data.frame(x)
        })
    }
    return(response)
}
