This repo contains the source code used to generate the BigML api
bindings for R.

Please, report problems and bugs to our
[BigML.io issue tracker](https://github.com/bigmlcom/io/issues)

Discussions about the different bindings take place in the general
[BigML mailing list](http://groups.google.com/group/bigml). Or join us
in our [Campfire chatroom](https://bigmlinc.campfirenow.com/f20a0)

# Build #

There is a small bundle.R script that will build a CRAN-ready bundle.
[Roxygen2](http://cran.r-project.org/web/packages/roxygen2/index.html)
is necessary for building the package documentation.  Simply run the
script in R while in the project directory.

# Tests #

There is a small unit test script called run_tests.R.

These tests compare the class structure of bigml responses to the
expected class structure (in JSON form). It will also check for
specific known responses (e.g., A particular response for a prediction
request on a model trained from the iris dataset). Simply evaluate the
code in run_tests.R in the project root in order to run the tests.

It requires the
[testthat](http://cran.r-project.org/web/packages/testthat/index.html)
library by Hadley Wickham.  Simply run the script in R while in the
project directory

It is necessary to run setCredentials() beforehand, or to set
`BIGML_USERNAME` and `BIGML_API_KEY` appropriately in your .Renviron
file.

There are some small utilities (misc.R) that make it easier to
manipulate the complex datastructures returned by R and the bigml API.
