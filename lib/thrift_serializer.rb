require "thrift_serializer/version"
require "thrift"

module ThriftSerializer

  # @serializer   = Thrift::Serializer.new
  # @deserializer = Thrift::Deserializer.new

  module_function

  def decode(data, model)
    # Thrift::Deserializer.new.deserialize(model, data)
  end

  def encode(data)
    # Thrift::Serializer.new.serialize(data)
  end

end
