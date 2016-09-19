require "thrift_serializer/version"
require "thrift"

class ThriftSerializerError < Exception
  def initialize(msg)
    super(msg)
  end
end

module ThriftSerializer

  module_function

  def decode(data, model)
    Thrift::Deserializer.new.deserialize(model, data)
  end

  def encode(data)
    begin
      Thrift::Serializer.new.serialize(data)
    rescue ArgumentError
      raise ThriftSerializerError.new("thrift struct field has invalid type")
    end
  end

end
