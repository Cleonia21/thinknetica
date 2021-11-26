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
#
# Разделить поезда на два типа PassengerTrain и CargoTrain,
# сделать родителя для классов, который будет содержать общие методы и свойства
#
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы).
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.
#
# При добавлении вагона к поезду, объект вагона должен передаваться как аргумент метода
# и сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания,
# где мы считали только кол-во вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.

class Train
  attr_accessor :speed, :route
  attr_reader :carriages, :number, :type

  def initialize(number, type)
    @number = number
    @speed = 0
    @carriages = []
    @route = nil
    @route_location = 0
    @type = type
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
