#' Retrieving a BigML Prediction
#' @export 
#' @param prediction_id the id of the prediction resource.
#' @template dots
#' @template author
getBigMLPrediction <-
function (prediction_id, ...) 
{
    .basic_api(.PREDICTION_URL)$postJson(prediction_id, ...)
}
