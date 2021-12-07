require_relative 'company'

class Carriage
  attr_reader :type, :number

  NUMBER_FORMAT = /^\d{3}\w$/
  TYPE_FORMAT = /(Cargo|Passenger|Empty)/

  include Company

  def initialize(number, value)
    @number = number
    @type = 'Empty'
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
    raise 'incorrect type format' if @type !~ TYPE_FORMAT
    raise 'incorrect number format' if @number !~ NUMBER_FORMAT
  end
end

class PassengerCarriage < Carriage
  attr_reader :occupied_place

  def initialize(number, value)
    super
    @type = 'Passenger'
    @place_num = value
    @occupied_place = 0
  end

  def take_the_place
    @occupied_place += 1
  end

  def free_place
    @place_num.to_i - @occupied_place
  end
end

class CargoCarriage < Carriage
  attr_accessor :occupied_volume

  def initialize(number, value)
    super
    @type = 'Cargo'
    @volume = value
    @occupied_volume = 0
  end

  def free_volume
    @volume.to_i - @occupied_volume
  end
end