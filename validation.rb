module Validation

  # Не придумал ничего лучше, чем найти готовое решение. Похоже на то что вы писали мне в телеграме,
  # но и то, и это решение для меня не очевидно.

  module ClassMethods
    def validate(field, method, *params)
      define_method("validate_#{field}_#{method}") do # создаем метод
        send(method.to_sym, instance_variable_get("@#{field}".to_sym), *params) # вызываем один из 3 описанных ниже методов
      end
    end
    # почему здесь при вызове метода через send он не выполняется?
    # В классе train такая строка ничего не выполняет, по крайней мере ничего не происходит:
    # validate :number, :format, NUMBER_FORMAT
  end

  module InstanceMethods
    def validate!
      # А здесь через send вызываем метод без параметров,
      # он отрабатывает с параметрами заданными выше. Как это работает?
      public_methods.each { |method| send(method) if method =~ /^validate_/ }
      true
    end

    def valid?
      validate!
    rescue
      false
    end

    protected

    def presence(value)
      raise "Value can't be blank" unless value.nil? || value == ''

      true
    end

    def format(value, reg_exp)
      raise 'Wrong value' unless value =~ reg_exp

      true
    end

    def type(value, type_class)
      raise 'Wrong type' unless value.instance_of?(type_class)

      true
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
