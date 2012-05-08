cmp.lists<-function(x,y){
	if (length(x) != length(y)) return(FALSE)
	if (!all(names(x) == names(y))) return(FALSE)
	for ( n in names(x)){
		if (x[[n]] != y[[n]]) return(FALSE)
	}
	return(TRUE)
}
nlaply <- function(data, fun){
	data = as.list(data)
	data_names = names(data)
	sapply(1:length(data_names), function(x){ fun(data_names[x], data[x])})
}
