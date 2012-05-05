#' @return If flatten is TRUE, and datasets_only = TRUE a data frame of:
#' \item{category}{numeric}
#' \item{code}{numeric}
#' \item{columns}{numeric}
#' \item{created}{character}
#' \item{credits}{numeric}
#' \item{description}{character}
#' \item{locale}{character}
#' \item{name}{character}
#' \item{number_of_models}{numeric}
#' \item{number_of_predictions}{numeric}
#' \item{private}{logical}
#' \item{resource}{character}
#' \item{rows}{numeric}
#' \item{size}{numeric}
#' \item{source}{character}
#' \item{source_status}{logical}
#' \item{status.bytes}{numeric}
#' \item{status.code}{numeric}
#' \item{status.elapsed}{numeric}
#' \item{status.message}{character}
#' \item{status.serialized_rows}{numeric}
#' \item{updated}{character}
#'
#' If flatten is TRUE and datasets_only = FALSE a list of:
#' \item{meta}{list}
#' \item{datasets}{data.frame}
#' \item{fields}{data.frame} 
#'
#' If flatten is FALSE a list of:
#' \item{meta}{list}
#' \item{objects}{list}
#'
#' see references for more details
