#' Listing BigML Datasets
#' @family dataset-methods
#' @export 
#' @param flatten A logical value indicating whether to flatten the response
#'	into a dataframe.
#' @param datasets_only A logical value indicating whether to only return 
#'	the data frame of field information (only valid if \code{flatten} is 
#'	\code{TRUE}).
#' @template dots
#' @template author
listBigMLDatasets <-
function (flatten = TRUE, datasets_only = TRUE, ...) 
{
    response = .basic_api(.DATASET_URL)$list(...)
    if (flatten) {
        response$datasets = ldply(response$objects, function(x) {
            x$fields = NULL
            x$status$field_errors = NULL
            x$status$row_format_errors = NULL
            as.data.frame(unlist(x, recursive = F))
        })
        response$fields = ldply(response$objects, function(y) {
            ldply(y$fields, function(z) {
                z = as.list(z)
                z$resource = y$resource
                as.data.frame(z)
            })
        })
        response$field_errors = ldply(response$objects, function(y) {
            ldply(y$status$field_errors, function(z) {
                z$resource = y$resource
                z$example = z$sample[[1]][[1]]
                z$count = z$sample[[1]][[2]]
                z$sample = NULL
                as.data.frame(z)
            })
        })
        response$row_format_errors = ldply(response$objects, 
            function(y) {
                ldply(y$status$row_format_errors, function(z) {
                  z$resource = y$resource
                  x$status$field_errors = NULL
                  x$status$row_format_errors = NULL
                  z$example = z$sample[[1]][[1]]
                  z$count = z$sample[[1]][[2]]
                  z$sample = NULL
                  as.data.frame(z)
                })
            })
        response$objects = NULL
        if (datasets_only) {
            response = response$datasets
        }
    }
    return(response)
}
