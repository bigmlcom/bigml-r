#' Retrieving a BigML Model
#' @export 
#' @param model_id A string giving the model id.
#' @param \dots Arbitrary named arguments that are passed on to 
#'	\code{\link{formEncodeURL}} in order to create form-encoded URL options 
#'	(see examples).
getBigMLModel <-
function (model_id, ...) 
{
    .basic_api(.MODEL_URL)$get(model_id, ...)
}
