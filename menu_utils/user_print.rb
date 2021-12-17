require_relative '../station'

class UserPrint

  def station(station)
    puts "station title: #{station.title}"
    # station.action_over_train { |train| self.train(train) }
  end

  def train(train)
    puts "train number: #{train.number}; type: #{train.type}; car num: #{train.carriages.count}"
    # train.action_over_carriage { |carriage| print '  ' ; self.carriage(carriage) }
  end

  def route(route)
    puts "#{route} stations:"
    route.stations.each { |station| print "(#{station.title}) " }
    puts ''
  end

  def carriage(carriage)
    print "carriage number: #{carriage.number}; type: #{carriage.type}; "
    puts "occupied_vol: #{carriage.occupied_volume}; free_vol: #{carriage.free_volume}" if carriage.type == 'Cargo'
    puts "occupied_place: #{carriage.occupied_place}; free_place: #{carriage.free_place}" if carriage.type == 'Passenger'
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

  def stations_in_full_format(stations)
    stations.each do |station|
      puts '-----'
      station(station)
      puts '-----'
      station.action_over_train { |train| train_in_full_format(train) }
    end
  end

  def train_in_full_format(train)
    puts "*** #{train.number}, #{train.type}, #{train.carriages.count} ***"
    train.action_over_carriage do |carriage|
      self.carriage(carriage)
    end
  end
end