#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class User
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  AGE = 2

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    AGE => {:type => ::Thrift::Types::I32, :name => 'age'}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field name is unset!') unless @name
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field age is unset!') unless @age
  end

  ::Thrift::Struct.generate_accessors self
end

