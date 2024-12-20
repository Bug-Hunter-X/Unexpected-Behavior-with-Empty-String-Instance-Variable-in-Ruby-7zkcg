```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def value
    @value
  end
end

my_object = MyClass.new(10)
puts my_object.value  #=> 10

my_object.instance_variable_set(:@value, 20)
puts my_object.value  #=> 20

# Unexpected behavior starts here
my_object.instance_variable_set(:@value, nil)
puts my_object.value #=> nil, as expected

my_object.instance_variable_set(:@value, [1,2,3])
puts my_object.value #=> [1, 2, 3], as expected

my_object.instance_variable_set(:@value, {})
puts my_object.value #=> {}, as expected

my_object.instance_variable_set(:@value, 3.14159)
puts my_object.value #=> 3.14159, as expected

my_object.instance_variable_set(:@value, true)
puts my_object.value #=> true, as expected

my_object.instance_variable_set(:@value, false)
puts my_object.value #=> false, as expected

# The unexpected behavior
my_object.instance_variable_set(:@value, 'abc')
puts my_object.value #=> "abc", as expected

my_object.instance_variable_set(:@value, '')
puts my_object.value #=> "", as expected

```