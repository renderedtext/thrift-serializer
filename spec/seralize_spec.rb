require "spec_helper"

describe "Deserialization" do
  it "decodes data from binary to thrift model" do
    user      = User.new
    user.name = "John Smith"
    user.age  = 42

    binary  = ThriftSerializer.encode(user)
    decoded = ThriftSerializer.decode(binary, User.new)

    expect(decoded.name).to eq(user.name)
    expect(decoded.age).to eq(user.age)
  end
end

describe "Serialization" do
  it "encodes hash to binary" do
    user      = User.new
    user.name = "John Smith"
    user.age  = 42

    binary  = ThriftSerializer.encode(user)
  end
end
