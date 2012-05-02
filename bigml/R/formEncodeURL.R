#' A simple function to turn named arguments into a form-encoded string
#' @export 
#' @param \dots arbitrary named arguments that will become part of a form-encoded url.
#' @param a something
#' @note Common usage includes specifying \code{username} and \code{api_key} 
#'	for individual API requests; or \code{limit} or \code{offset} parameters
#' 	useful for paging through list requests.
#' @return form-encoded string result
#' @template author
formEncodeURL <-
function (a,...) 
{
    opt_args = list(...)
	sys_user = Sys.getenv("BIGMLUSER")
	sys_key = Sys.getenv("BIGMLAPIKEY")
	if (!"username" %in% opt_args && sys_user != ''){
		opt_args$username = sys_user
	}
	if (!"api_key" %in% opt_args && sys_key != ''){
		opt_args$api_key = sys_key
	}
    res = ""
    for (v in names(opt_args)) {
        encoded = curlPercentEncode(opt_args[v])
        res = paste(res, v, "=", encoded, "&", sep = "")
    }
	if (nchar(res) <= 0){
		return('')
	} else{
		res = strtrim(res, nchar(res) - 1)
	    return(paste("?", res, sep = ""))
	}

}
