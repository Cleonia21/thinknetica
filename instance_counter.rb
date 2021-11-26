module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstansMethods
  end

  module InstansMethods
    def register_instance
      self.class.copy_number = 0 if self.class.copy_number.nil?
      self.class.copy_number += 1
    end
  end

  module ClassMethods
    attr_accessor :copy_number

    def instances
      @copy_number
    end
  end
end

# module InstanceCounter
#   def self.included(base)
#     base.extend ClassMethods
#     base.send :include, InstanceMethods
#   end
#
#   module ClassMethods
#     attr_accessor :count_instances
#
#     def instances
#       puts "#{@count_instances} экземпляра класса"
#     end
#   end
#
#   module InstanceMethods
#
#     protected
#
#     def register_instance
#       self.class.count_instances ||= 0
#       self.class.count_instances += 1
#     end
#   end
# end
