#' Retrieving a BigML Model
#' @export 
#' @templateVar family_name model
#' @template family
#' @param model_id A string giving the model id.
#' @template dots
#' @template model_return
#' @template author
getModel <-
function (model_id, ...) 
{
   .basic_api(.MODEL_URL)$get(id=model_id, ...)
}
