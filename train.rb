require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include Company
  include InstanceCounter
  include Validation

  attr_accessor :speed, :route
  attr_reader :carriages, :number, :type

  NUMBER_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze
  TYPE_FORMAT = /(Cargo|Passenger|Empty)/.freeze

  validate :number, :format, NUMBER_FORMAT
  validate :type, :format, TYPE_FORMAT

  @@find = []

  def initialize(number, type)
    @number = number
    @speed = 0
    @carriages = []
    @route = nil
    @route_location = 0
    @type = type
    @@find << self
    register_instance
    validate!
  end

  def action_over_carriage(&block)
    @carriages.each { |carriage| block.call(carriage) }
  end

  def self.find(number)
    @@find.each do |train|
      return train if train.number == number
    end
    nil
  end

  def attach_carriage(carriage)
    @carriages << carriage if @speed.zero? && carriage.type == @type
  end

  def unhook_carriage(carriage)
    @carriages.delete(carriage) if @speed.zero? && carriage.type == @type
  end

  def brake_speed
    @speed = 0
  end

  def move_back
    @route_location -= 1 unless @route_location.zero?
  end

  def move_forward
    @route_location += 1 if @route.stations.length != @route_location + 1
  end

  def previous_station
    @route.stations[@route_location - 1] unless @route_location.zero? || @route.nil?
  end

  def station
    @route.stations[@route_location] unless @route.nil?
  end

  def next_station
    @route.stations[@route_location + 1] unless @route.nil?
  end

end
