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
end
