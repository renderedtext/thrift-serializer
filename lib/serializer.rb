require "serializer/version"
require "thrift"

module Serializer

  serializer   = Thrift::Serializer.new
  deserializer = Thrift::Deserializer.new

  module_function

  def decode(data, model)
    deserializer.deserialize(model, data)
  end

  def encode(data)
    serializer.serialize(data)
  end

end
