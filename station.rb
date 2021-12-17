# Класс Station (Станция):
# + Имеет название, которое указывается при ее создании
# + Может принимать поезда (по одному за раз)
# + Может возвращать список всех поездов на станции, находящиеся в текущий момент
# + Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# + Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,
# находящихся на станции).

require_relative 'instance_counter'

class Station
  attr_reader :trains, :title

  TITLE_FORMAT = /[a-z]/i

  @@all = []

  include InstanceCounter

  def initialize(title)
    @title = title
    @trains = []
    @@all << self
    register_instance
  end

  def self.all
    @@all
  end

  def send_train(train)
    @trains.delete(train)
  end

  def add_train(train)
    @trains << train
  end

  def trains_by(type)
    @trains.find_all { |t| t.type == type }
  end

  def action_over_train(&block)
    @trains.each { |train| block.call(train) }
  end

  def valid?
    valid!
    true
  rescue
    false
  end

  private

  def valid!
    raise "incorrect title format" if @title !~ TITLE_FORMAT
  end
end
