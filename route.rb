# Класс Route (Маршрут):
# + Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
# + Может добавлять промежуточную станцию в список
# + Может удалять промежуточную станцию из списка
# + Может выводить список всех станций по-порядку от начальной до конечной

require_relative 'instance_counter'

class Route
  attr_reader :stations

  include InstanceCounter

  def initialize(first, last) # Здесь принимаем объект класса Станция, наверное валидировать вообще не нужно?
    @stations = [first, last]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
    else
      puts 'You can t dell first or last station'
    end
  end
end
