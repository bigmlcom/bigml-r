#' Retrieving a BigML Prediction
#' @export 
#' @param prediction_id the id of the prediction resource.
#' @param \dots Arbitrary named arguments that are passed on to 
#'	\code{\link{formEncodeURL}} in order to create form-encoded URL options 
#'	(see examples).
getBigMLPrediction <-
function (prediction_id, ...) 
{
    .basic_api(.PREDICTION_URL)$postJson(prediction_id, ...)
}
