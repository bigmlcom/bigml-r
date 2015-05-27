# Set credentials beforehand with setCredentials, or include them in an
# .Renviron file.
require(bigml)
require(testthat)
readRenviron('~/.Renviron')



# load some dummy data for equivalency tests, get the json from an existing successful result
# dummy_source_json = toJSON(lapply(quickSource(iris),class))
dummy_source_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"content_type\": \"character\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"description\": \"character\",\n\"fields\": \"data.frame\",\n\"file_name\": \"character\",\n\"md5\": \"character\",\n\"name\": \"character\",\n\"number_of_datasets\": \"numeric\",\n\"number_of_models\": \"numeric\",\n\"number_of_predictions\": \"numeric\",\n\"private\": \"logical\",\n\"resource\": \"character\",\n\"size\": \"numeric\",\n\"source_parser\": \"list\",\n\"status\": \"list\",\n\"tags\": \"AsIs\",\n\"type\": \"numeric\",\n\"updated\": \"character\" \n}"
dummy_source_classes = as.list(fromJSON(dummy_source_json))

# dummy_dataset_json = toJSON(lapply(quickDataset(iris),class))
dummy_dataset_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"columns\": \"numeric\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"description\": \"character\",\n\"fields\": \"list\",\n\"locale\": \"character\",\n\"name\": \"character\",\n\"number_of_models\": \"numeric\",\n\"number_of_predictions\": \"numeric\",\n\"private\": \"logical\",\n\"resource\": \"character\",\n\"rows\": \"numeric\",\n\"size\": \"numeric\",\n\"source\": \"character\",\n\"source_status\": \"logical\",\n\"status\": \"list\",\n\"tags\": \"AsIs\",\n\"updated\": \"character\",\n\"fields_overview\": \"data.frame\" \n}"
dummy_dataset_classes = as.list(fromJSON(dummy_dataset_json))

# dummy_dataset_json = toJSON(lapply(quickModel(iris),class))
dummy_model_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"columns\": \"numeric\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"dataset\": \"character\",\n\"dataset_status\": \"logical\",\n\"description\": \"character\",\n\"input_fields\": \"character\",\n\"locale\": \"character\",\n\"max_columns\": \"numeric\",\n\"max_rows\": \"numeric\",\n\"model\": \"list\",\n\"name\": \"character\",\n\"number_of_predictions\": \"numeric\",\n\"objective_fields\": \"character\",\n\"private\": \"logical\",\n\"range\": \"numeric\",\n\"resource\": \"character\",\n\"rows\": \"numeric\",\n\"size\": \"numeric\",\n\"source\": \"character\",\n\"source_status\": \"logical\",\n\"status\": \"list\",\n\"tags\": \"AsIs\",\n\"updated\": \"character\" \n}"
dummy_model_classes = as.list(fromJSON(dummy_model_json))

# dummy_lsource_json = toJSON(lapply(listSources(),class))
dummy_lsource_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"content_type\": \"character\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"description\": \"character\",\n\"file_name\": \"character\",\n\"md5\": \"character\",\n\"name\": \"character\",\n\"number_of_datasets\": \"numeric\",\n\"number_of_models\": \"numeric\",\n\"number_of_predictions\": \"numeric\",\n\"private\": \"logical\",\n\"resource\": \"character\",\n\"size\": \"numeric\",\n\"source_parser.header\": \"logical\",\n\"source_parser.locale\": \"character\",\n\"source_parser.missing_tokens\": \"character\",\n\"source_parser.quote\": \"character\",\n\"source_parser.separator\": \"character\",\n\"source_parser.trim\": \"logical\",\n\"status.code\": \"numeric\",\n\"status.elapsed\": \"numeric\",\n\"status.message\": \"character\",\n\"type\": \"numeric\",\n\"updated\": \"character\" \n}"
dummy_source_list_classes = as.list(fromJSON(dummy_lsource_json))

# dummy_ldataset_json = toJSON(lapply(listDatasets(),class))
dummy_ldataset_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"columns\": \"numeric\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"description\": \"character\",\n\"locale\": \"character\",\n\"name\": \"character\",\n\"number_of_models\": \"numeric\",\n\"number_of_predictions\": \"numeric\",\n\"private\": \"logical\",\n\"resource\": \"character\",\n\"rows\": \"numeric\",\n\"size\": \"numeric\",\n\"source\": \"character\",\n\"source_status\": \"logical\",\n\"status.bytes\": \"numeric\",\n\"status.code\": \"numeric\",\n\"status.elapsed\": \"numeric\",\n\"status.message\": \"character\",\n\"status.serialized_rows\": \"numeric\",\n\"updated\": \"character\" \n}"
dummy_dataset_list_classes = as.list(fromJSON(dummy_ldataset_json))

# dummy_ldataset_json = toJSON(lapply(listModels(),class))
dummy_lmodel_json = "{\n \"category\": \"numeric\",\n\"code\": \"numeric\",\n\"columns\": \"numeric\",\n\"created\": \"character\",\n\"credits\": \"numeric\",\n\"dataset\": \"character\",\n\"dataset_status\": \"logical\",\n\"description\": \"character\",\n\"locale\": \"character\",\n\"max_columns\": \"numeric\",\n\"max_rows\": \"numeric\",\n\"name\": \"character\",\n\"number_of_predictions\": \"numeric\",\n\"objective_fields\": \"character\",\n\"private\": \"logical\",\n\"resource\": \"character\",\n\"rows\": \"numeric\",\n\"size\": \"numeric\",\n\"source\": \"character\",\n\"source_status\": \"logical\",\n\"updated\": \"character\" \n}"
dummy_model_list_classes = as.list(fromJSON(dummy_lmodel_json))

message("
List operations require at least one source, dataset, and model resource in
the testing account
")

qs={}
qds={}
qm={}
qp={}

test_that("Creation operations work",{
	#quickSource will implicitly test createSource
	qs <<- quickSource(iris)
	#ditto createDataset
	qds <<- quickDataset(iris)
	#ditto createModel
	qm <<- quickModel(iris)
	# and predictions
	qp <<- quickPrediction(qm,iris[1,])

	expect_equal(qp, 'setosa')
})

test_that("Delete operations work",{
	expect_true(deleteResource(qs))
	expect_true(deleteResource(qds))
	expect_true(deleteResource(qm))
})
