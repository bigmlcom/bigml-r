require(roxygen2);  
roxygenize('bigml', roxygen.dir='bigml', copy.package=F, unlink.target=F)
system("R CMD CHECK bigml")
system("R CMD INSTALL bigml")
system("R CMD BUILD bigml")
