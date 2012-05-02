#' Retrieving a BigML Model
#' @export 
#' @param model_id A string giving the model id.
#' @template dots
#' @template author
getBigMLModel <-
function (model_id, ...) 
{
    .basic_api(.MODEL_URL)$get(model_id, ...)
}
