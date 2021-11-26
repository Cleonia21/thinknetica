class MyClass
  @@num = 0

  def initialize
    num_plus
  end

  def self.num
    @@num
  end

  def num_plus
    @@num += 1
  end
end

MyClass.new
MyClass.new
MyClass.new
MyClass.new
puts MyClass.num