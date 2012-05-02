#' Creating BigML Datasets
#' @export 
#' @family dataset-methods
#' @param source_id The relevant source id.
#' @param field_ids A list of field ids and field properties.  See example.
#' @param name The name for the dataset.
#' @param size The amount (in bytes) of the source to use for creating the dataset.
#' @param \dots Arbitrary named arguments that are passed on to 
#'	\code{\link{formEncodeURL}} in order to create form-encoded URL options 
#'	(see examples).
#' @return A BigML response object
#' @examples 
#' \dontrun{
#' # simple create dataset example
#' createBigMLDataset("source/1")
#' # configure a number of different parameters
#' createBigMLDataset("source/2", field_ids=c('000001'), name='test', size=10)
#' }
#' @references 
#' \url{https://bigml.com/developers/datasets}
#' @author Justin Donaldson \email{donaldson@@bigml.com}
#' @details Two functions are provided for creating datasets. \code{createBigmlDataset} accepts source id strings
createBigMLDataset <-
function (source_id, field_ids = NULL, name = NULL, size = NULL, 
    ...) 
{
    option = list()
    option$source = source_id
    if (!is.null(field_ids)) 
        option$fields = field_ids
    if (!is.null(name)) 
        option$name = name
    if (!is.null(size)) 
        option$size = size
    response = .basic_api(.DATASET_URL)$postJson(option, ...)
    while (response$code == 201) {
        message("Dataset creation in progress...")
        Sys.sleep(5)
        response = getBigMLDataset(response$resource)
    }
    return(response)
}
