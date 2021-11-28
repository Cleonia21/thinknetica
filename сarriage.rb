require_relative 'company'

class Carriage
  attr_reader :type, :number

  NUMBER_FORMAT = /^\d{3}\w$/
  TYPE_FORMAT = /(Cargo|Passenger|Empty)/

  include Company

  def initialize(number, type)
    @number = number
    @type = type
    valid!
  end

  def valid?
    valid!
    true
  rescue
    false
  end

  private

  def valid!
    raise "incorrect type format" if @type !~ TYPE_FORMAT
    raise "incorrect number format" if @number !~ NUMBER_FORMAT
  end
end