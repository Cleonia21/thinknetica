require_relative '../station'

class UserPrint

  def station(station)
    puts "station title: #{station.title}; address: #{station}"
  end

  def train(train)
    puts "train number: #{train.number}; type: #{train.type}; address: #{train}"
  end

  def route(route)
    puts "#{route} stations:"
    route.stations.each { |station| print "(#{station.title}) " }
    puts ''
  end

  def carriage(carriage)
    puts "carriage number: #{carriage.number}; type: #{carriage.type}"
  end

  def stations(stations)
    i = 1
    stations.each do |station|
      print "#{i}) "
      station(station)
      i += 1
    end
  end

  def trains(trains)
    i = 1
    trains.each do |train|
      print "#{i}) "
      train(train)
      i += 1
    end
  end

  def routes(routes)
    i = 1
    routes.each do |route|
      print "#{i}) "
      route(route)
      i += 1
    end
  end

  def carriages(carriages)
    i = 1
    carriages.each do |carriage|
      print "#{i}) "
      carriage(carriage)
      i += 1
    end
  end

  def train_in_the_station(station)
    puts "trains in the station #{station}"
    station.trains.each { |train| self.train(train) }
  end

  def stations_in_the_route(route)
    puts "stations in the route #{route}"
    route.stations.each { |station| self.station(station) }
  end
end