require "spec_helper"

describe "serializers" do
  it "encodes data" do
    user      = User.new
    user.name = "John Smith"
    user.age  = 42

    binary = ThriftSerializer.encode(user)
    decoded = ThriftSerializer.decode(binary, User.new)

    expect(decoded == user).to rq(true)
  end
end
