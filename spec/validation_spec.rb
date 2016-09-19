require "spec_helper"

describe "Model validation" do
  it "validates hash fields type during serialization" do
    user      = User.new
    user.name = "John Smith"
    user.age  = "42"

    expect{ThriftSerializer.encode(user)}.to raise_error(ThriftSerializerError)
  end

  it "validates hash fields" do
    user = User.new
    expect{user.id = 15}.to raise_error(NoMethodError)
  end

  it "valdiates required hash fields" do
    user      = User.new
    user.name = "John Smith"
    # Required filed 'age' is missing

    expect{ThriftSerializer.encode(user)}.to raise_error(Thrift::ProtocolException)
  end
end
