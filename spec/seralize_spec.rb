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
    expect(binary).to eq("\v\x00\x01\x00\x00\x00\nJohn Smith\b\x00\x02\x00\x00\x00*\x00")
  end
end

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
end
