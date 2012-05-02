#' Retrieving a BigML Dataset
#' @export 
#' @family dataset-methods
#' @param source_id A string giving the name of the source id.
#' @param include_overview A logical value indicating whether to provide a
#'	simple data frame overview of fields.
#' @param \dots Arbitrary named arguments that are passed on to 
#'	\code{\link{formEncodeURL}} in order to create form-encoded URL options 
#'	(see examples).
getBigMLDataset <-
function (source_id, include_overview = TRUE, ...) 
{
    response = .basic_api(.DATASET_URL)$get(id = source_id)
    if (include_overview) {
        tmpfields = ldply(response$fields, function(y) {
            y$summary = NULL
            as.data.frame(y)
        })
        response$fields_overview = tmpfields
    }
    return(response)
}
