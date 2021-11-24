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

  private

  def put_station_in_route(first, stations, last)
    route = Route.new(first, last)
    stations.each { |station| route.add_station(station) }
    route
  end
end
