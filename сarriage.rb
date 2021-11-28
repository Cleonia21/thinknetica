require_relative 'company'

class Carriage
  attr_reader :type, :number

  include Company

  def initialize(number, type)
    @number = number
    @type = type
  end
end