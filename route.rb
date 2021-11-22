# Класс Route (Маршрут):
# + Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
# + Может добавлять промежуточную станцию в список
# + Может удалять промежуточную станцию из списка
# + Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_reader :route

  def initialize(first, last)
    @route = [first, last]
  end

  def add_station(station)
    @route.insert(-1, station)
  end

  def delete_station(station)
    if station != @route[0] && station != @route[-1]
      @route.delete(station)
    else
      puts 'You can t dell first or last station'
    end
  end
end
