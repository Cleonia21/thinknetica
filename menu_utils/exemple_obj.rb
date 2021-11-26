class ExempleObj
  def stations
    stations = []
    stations[0] = Station.new('Moscow')
    stations[1] = Station.new('New York')
    stations[2] = Station.new('Berlin')
    stations[3] = Station.new('Paris')
    stations[4] = Station.new('Oslo')
    stations[5] = Station.new('Rome')
    stations[6] = Station.new('Kiev')
    stations[7] = Station.new('London')
    stations[8] = Station.new('Beijing')
    stations[9] = Station.new('Cairo')
    stations.shuffle
  end

  def routes
    routes = []
    first = Station.new('first')
    last = Station.new('last')
    routes[0] = put_station_in_route(first, stations, last)
    routes[1] = put_station_in_route(first, stations, last)
    routes[2] = put_station_in_route(first, stations, last)
    routes[3] = put_station_in_route(first, stations, last)
    routes[4] = put_station_in_route(first, stations, last)
    routes
  end

  def trains
    trains = []
    trains[0] = Train.new(0, 'empty')
    trains[1] = PassengerTrain.new(1, '')
    trains[2] = CargoTrain.new(2, '')
    routes = self.routes
    trains[0].route = routes[0]
    trains[1].route = routes[1]
    trains[2].route = routes[2]
    trains
  end

  def carriages
    carriages = []
    carriages[0] = Carriage.new(12_432, 'passenger')
    carriages[1] = Carriage.new(32_455, 'passenger')
    carriages[2] = Carriage.new(64_342, 'passenger')
    carriages[3] = Carriage.new(23_423, 'cargo')
    carriages[4] = Carriage.new(53_323, 'cargo')
    carriages[5] = Carriage.new(95_856, 'cargo')
    carriages[6] = Carriage.new(21_435, 'empty')
    carriages[7] = Carriage.new(93_923, 'empty')
    carriages[8] = Carriage.new(60_211, 'empty')
    carriages
  end

  private

  def put_station_in_route(first, stations, last)
    route = Route.new(first, last)
    stations.each { |station| route.add_station(station) }
    route
  end
end
