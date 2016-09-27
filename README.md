# Thrift Serializer

[![Build Status](https://semaphoreci.com/api/v1/renderedtext/thrift-serializer/branches/master/badge.svg)](https://semaphoreci.com/renderedtext/thrift-serializer)

Encodes hashes to `thrift` messages and decodes `thrift` messages to hashes.

# Installation

Add this line to your application's Gemfile:

``` ruby
gem "rt-thrift-serializer", :github => "renderedtext/thrift-serializer", :require => "thrift_serializer"
```

# Encode hashes into Thrift messages

``` ruby
user      = User.new
user.name = "John Smith"
user.age  = 42

ThriftSerializer.encode(user)
# => "\v\x00\x01\x00\x00\x00\nJohn Smith\b\x00\x02\x00\x00\x00*\x00"

```

# Decode Thrift messages into hashes

``` ruby
ThriftSerializer.decode(user, User.new)
# => { :name => "John Smith", :age => 32 }
```

**NOTE:** Make sure that app using `ThriftSerializer` have compiled `.thrift` file

# Model Validation

Hashes are validated against corresponding struct defined in `.thrift` file in app that use `ThriftSerializer`

Let your `.thrift` file have following struct:

``` thrift
struct User {
  1: required string name
  2: required i32 age
}
```

Exception is raised in case:

* Required field is missing

``` ruby
user      = User.new
user.name = "John Smith"
# Required field 'age' is missing

ThriftSerializer.encode(user)

# => raises Thrift::ProtocolException
```

* If there are any extra fields

``` ruby
user      = User.new
user.name = "John Smith"
user.age  = 42
user.id   = 101

# => raises NoMethodError
```

* Invalid struct field type

``` ruby
user      = User.new
user.name = "John Smith"
user.age  = "42"          # `age` is type of `i32`, got `string`

ThriftSerializer.encode(user)

# => raises ThriftSerializerError
```
