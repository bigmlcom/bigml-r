#' Creating BigML Datasets
#' @export 
#' @templateVar family_name dataset
#' @template family
#' @param source_id The relevant source id.
#' @param field_ids A list of field ids and field properties.  See example.
#' @param name The name for the dataset.
#' @param size The amount (in bytes) of the source to use for creating the dataset.
#' @template dots
#' @template dataset_return
#' @examples 
#' \dontrun{
#' # simple create dataset example
#' createDataset("source/1")
#' # configure a number of different parameters
#' createDataset("source/2", field_ids=c('000001'), name='test', size=10)
#' }
#' @template author
createDataset <-
function (source_id, field_ids = NULL, name = NULL, size = NULL, ...) 
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
        response = getDataset(response$resource)
    }
    return(response)
}
