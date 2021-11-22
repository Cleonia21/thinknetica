# Класс Train (Поезд):
# + Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
# эти данные указываются при создании экземпляра класса
# + Может набирать скорость
# + Может возвращать текущую скорость
# + Может тормозить (сбрасывать скорость до нуля)
# + Может возвращать количество вагонов
# + Может прицеплять/отцеплять вагоны (по одному вагону за операцию,
# метод просто увеличивает или уменьшает количество вагонов).
# + Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# + Может принимать маршрут следования (объект класса Route).
# + При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# + Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
# но только на 1 станцию за раз.
# + Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_accessor :speed
  attr_reader :number_of_cars

  def initialize(number, type, number_of_cars)
    @speed = 0
    @number = number
    @type = type
    @number_of_cars = number_of_cars
  end

  def brake_speed
    @speed = 0
  end

  def attach_car
    @number_of_cars += 1 if @speed.zero?
  end

  def unhook_car
    @number_of_cars -= 1 if @speed.zero? && @number_of_cars != 0
  end

  def route=(route)
    @route = route
    @route_location = 0
  end

  def move_back
    @route_location -= 1 unless @route_location.zero?
  end

  def move_forward
    @route_location += 1 if @route.length != @route_location + 1
  end

  def previous_station
    @route[@route_location - 1] unless @route_location.zero?
  end

  def station
    @route[@route_location]
  end

  def next_station
    @route[@route_location + 1]
  end
end
