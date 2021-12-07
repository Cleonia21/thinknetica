require_relative 'instance_counter'

class Route
  attr_reader :stations

  include InstanceCounter

  def initialize(first, last)
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
