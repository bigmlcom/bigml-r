#' Quickly Creating BigML Models
#' @export 
#' @templateVar family_name model
#' @template family
#' @family quick methods
#' @param data A matrix or data frame containing data to upload to bigml.
#' @param holdout A numeric value giving the ratio of dataset instances to 
#'	use as a holdout set for post-train pruning.
#' @param input_fields A vector of string names to use for training.
#' @param objective_fields A single string value to use as an objective field 
#'	(objective_fields is plural for future use).
#' @param name A string giving the name of the model.
#' @param range A two element numeric vector that defines a range over 
#'	the dataset in which to train on.
#' @template dots
#' @template model_return
#' @template author
quickModel <-
function (data, holdout = 0.2, input_fields = names(data), objective_fields = tail(names(data), 
    n = 1), name = paste(deparse(substitute(data)), "'s model", 
    sep = ""), range = NULL, ...) 
{
    dresponse = quickDataset(data)
    option = list()
    option$dataset = dresponse$resource
    if (!is.null(range)) 
        option$range = range
    input_field_ids = NULL
    if (!is.null(input_fields) && !all(input_fields == names(data))) {
        input_field_ids = sapply(input_fields, function(x) {
            id = .resolve_field_id(x, dresponse$fields)
            if (id == NULL) {
                stop(paste("input field is not in dataframe:", 
                  x))
            }
            return(id)
        })
        input_field_ids = as.vector(input_field_ids)
    }
    if (!is.null(input_field_ids)) 
        option$input_fields = input_field_ids
    objective_field_ids = NULL
    if (!is.null(objective_fields)) {
        objective_field_ids = sapply(objective_fields, function(x) {
            id = .resolve_field_id(x, dresponse$fields)
            if (is.null(id)) {
                stop(paste("objective field is not in dataframe:", 
                  x))
            }
            return(as.character(id))
        })
        objective_field_ids = as.vector(objective_field_ids)
    }
    response = .basic_api(.MODEL_URL)$postJson(option, ...)
    while (response$code == 201) {
        message("Model creation in progress...")
        Sys.sleep(5)
        response = getModel(response$resource)
    }
    return(response)
}
