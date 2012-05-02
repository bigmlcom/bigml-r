#' Creating BigML Sources
#' @export 
#' @param file_name A string giving a file location
#' @param name A string specifying the name of the source
#' @param header logical; TRUE if data contains name information, false 
#'	otherwise.
#' @param locale A string giving the locale (defaults to en-US).
#' @param missing_tokens A vector of character strings that will be used to 
#'	specify missing values in a file name.
#' @param quote A string specifying the quoting character used.
#' @param separator the separator character used when a file name is 
#' 	specified.
#' @param trim A logical value indicating whether white space should be 
#'	trimmed.
#' @param flatten A logical value indicating whether or not the returned 
#'	field objects should be "flattened"	into a data frame.
#' @template dots
#' @return A BigML source response.
#' @examples 
#' \dontrun{
#' # simple example
#' m1 = createBigMLSource("/tmp/iris.csv")
#' 
#' }
#' @template author
createBigMLSource <-
function (file_name, name =basename(file_name), header = TRUE, 
	locale = "en-US", missing_tokens = c("NA"), quote = "\"", 
	separator = ",", trim = TRUE, flatten = TRUE, ...) 
{
    params = fileUpload(file_name)
    params$name = name
    source_parser = list()
    source_parser$header = header
    source_parser = toJSON(source_parser)
    response = .basic_api(.SOURCE_URL)$upload(file = params, 
        name = name, source_parser = source_parser, ...)
    while (response$code == 201) {
        message("Source creation in progress...")
        Sys.sleep(5)
        response = getBigMLSource(response$resource, flatten = flatten, ...)
    }
    unlink(file_name)
    response

}
