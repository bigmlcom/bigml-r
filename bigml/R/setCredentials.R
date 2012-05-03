#' Set BigML API authentication credentials
#' @export 
#' @param username use the given username for all subsequent API requests
#' @param api_key use the given api key for all subsequent API requests
#' @return NULL
#' @template author
#' @examples 
#' \dontrun{
#' # replace with your valid credentials:
#'	setCredentials('username', 'key')
#' }
setCredentials <-
function (username, api_key) 
{
    Sys.setenv(BIGMLUSER=username)
    Sys.setenv(BIGMLAPIKEY=api_key)
}
