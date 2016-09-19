$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "thrift_serializer"

`thrift -r --gen rb spec/thrift/models.thrift`

$:.push("gen-rb")
require "models_constants"
