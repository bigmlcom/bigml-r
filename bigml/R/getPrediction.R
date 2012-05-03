#' Retrieving a BigML Prediction
#' @export 
#' @templateVar family_name prediction
#' @template family
#' @param prediction_id the id of the prediction resource.
#' @template dots
#' @template prediction_return
#' @template author
getPrediction <-
function (prediction_id, ...) 
{
    .basic_api(.PREDICTION_URL)$postJson(prediction_id, ...)
}
