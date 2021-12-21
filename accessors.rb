module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        eval("@#{name}_history ||= []")
        eval("@#{name}_history << value")
      end
      define_method("#{name}_history") { instance_variable_get("@#{name}_history".to_sym) }
    end
  end

  def strong_attr_accessor(*names, class_obj)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        raise 'incorrect type' if class_obj.to_s != value.class.to_s

        instance_variable_set(var_name, value)
      end
    end
  end
end

# class Test
#   extend Acсessors
#
#   strong_attr_accessor :a, :Integer
# end
#
# test = Test.new
# test.a = 1
# puts test.a

# puts 1.class
