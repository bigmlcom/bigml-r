#' Creating BigML Predictions
#' @export 
#' @param model_id character string; the model id
#' @param input_field_ids a list of input field ids and values to make a 
#'	prediction for (see example).
#' @param name character string; The given name for the prediction.
#' @template dots
#' @return A BigML response object
#' @examples 
#' \dontrun{
#' # simple example
#' m1 = createBigMLPrediction("model/1", 
#'	input_field_ids = c(000001='somevalue', 000002=9999))
#' # configure a number of different parameters
#' m2 = createBigMLPrediction("model/2", 
#'	input_field_ids = c(000001='somevalue', 000002=9999), 
#'	name='new prediction')
#' }
#' @references 
#' \url{https://bigml.com/developers/datasets}
#' @template author
createBigMLPrediction <-
function (model_id, input_field_ids, name = NULL, ...) 
{
    option = list()
    option$input_fields = input_field_ids
    if (!is.null(name)) 
        option$name = name
    .basic_api(.PREDICTION_URL)$post(option, ...)
}
