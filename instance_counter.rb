module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstansMethods
  end

  module InstansMethods
    def register_instance
      self.class.copy_number ||= 0
      self.class.copy_number += 1
    end
  end

  module ClassMethods
    attr_accessor :copy_number

    def instances
      @copy_number ||= 0
      @copy_number
    end
  end
end
