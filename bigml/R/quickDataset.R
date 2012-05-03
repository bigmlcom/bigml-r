#' Quickly Creating BigML Datasets
#' @export 
#' @templateVar family_name dataset
#' @template family
#' @family quick methods
#' @param data A matrix or data frame containing data to upload to bigml.
#' @param name A string giving the name for the dataset.
#' @param fields A vector of names in \code{data} that should be used for 
#'	creating the dataset.
#' @param size A numeric value giving the amount (in bytes) of the source
#'	to use.
#' @template dots
#' @template dataset_return
#' @template author
#' @examples 
#' \dontrun{
#' # simple example
#' quickDataset(iris)
#' # configure a number of different parameters
#' quickDataset(iris, fields = c('Species', 'Sepal.length'), 
#'	name='test', size=10000)
#' }
quickDataset <-
function (data, fields = names(data), name = paste(deparse(substitute(data)), 
    "'s dataset", sep = ""), size = NULL, ...) 
{
    option = list()
    sresponse = quickSource(data,  name = deparse(substitute(data)), 
		flatten = F, ...)
    if (is.null(name)) 
        name = paste(sresponse$file_name, "'s dataset", sep = "")
    classes = lapply(data, class)
    type_classes = lapply(classes, function(x) {
        if (x == "numeric") 
            return("numeric")
        else if (x == "factor") 
            return("categorical")
        else return("text")
    })
    option$fields = lapply(sresponse$fields, function(x) {
        type = as.character(type_classes[x$column_number + 1])
        list(optype = type)
    })
    option$name = name
    option$source = sresponse$resource
    if (is.null(size)) 
        option$size = size
    response = .basic_api(.DATASET_URL)$postJson(option, ...)
    while (response$code == 201) {
        message("Dataset creation in progress...")
        Sys.sleep(5)
        response = getDataset(response$resource, ...)
    }
    return(response)
}
