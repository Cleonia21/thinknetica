# Класс Station (Станция):
# + Имеет название, которое указывается при ее создании
# + Может принимать поезда (по одному за раз)
# + Может возвращать список всех поездов на станции, находящиеся в текущий момент
# + Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# + Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,
# находящихся на станции).

class Station
  attr_reader :trains_cargo, :trains_passenger

  def initialize(title)
    @title = title
    @trains_cargo = []
    @trains_passenger = []
  end

  def add_trains(train)
    @trains_cargo << train if train.type == 'cargo'
    @trains_passenger << train if train.type == 'passenger'
  end

  def send_train(train)
    @trains_cargo.delete(train)
    @trains_passenger.delete(train)
  end

  def trains
    trains = [@trains_cargo, @trains_passenger]
    trains.flatten
  end
end