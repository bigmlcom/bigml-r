#' @return If flatten is TRUE, and models_only = TRUE a data frame of:
#' \item{category}{numeric}
#' \item{code}{numeric}
#' \item{columns}{numeric}
#' \item{created}{character}
#' \item{credits}{numeric}
#' \item{dataset}{character}
#' \item{dataset_status}{logical}
#' \item{description}{character}
#' \item{holdout}{numeric}
#' \item{locale}{character}
#' \item{max_columns}{numeric}
#' \item{max_rows}{numeric}
#' \item{name}{character}
#' \item{number_of_predictions}{numeric}
#' \item{objective_fields}{character}
#' \item{private}{logical}
#' \item{resource}{character}
#' \item{rows}{numeric}
#' \item{size}{numeric}
#' \item{source}{character}
#' \item{source_status}{logical}
#' \item{updated}{character}
#'
#' If flatten is TRUE and sources_only = FALSE a list of:
#' \item{meta}{list}
#' \item{models}{data.frame}
#'
#' If flatten is FALSE a list of:
#' \item{meta}{list}
#' \item{objects}{list}
#'
#' see references for more details
