$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

`thrift -r --gen rb thrift/models.thrift`

$:.push("gen-rb")
require_relative "models_constants"
