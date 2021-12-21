require_relative '../route'
require_relative '../station'
require_relative '../train'
require_relative '../cargo_train'
require_relative '../passenger_train'
require_relative '../carriage'
require_relative 'print_obj'
require_relative 'text_menu'
require_relative 'user_print'
require_relative '../company'
require_relative '../instance_counter'

class ExampleObj

  attr_accessor :stations, :trains, :routes, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
    @stations_title = ['Moscow', 'New York', 'Berlin', 'Paris', 'Oslo', 'Rome', 'Kiev', 'London', 'Beijing', 'Cairo']
  end

  def route
    route = Route.new(self.station, self.station)
    # 8.times { route.add_station(self.station) }
    @stations.each do |station|
      rand(5).times do
        train = self.train
        train.route = route
        station.add_train(train)
      end
    end
    @routes << route
    @routes.last
  end

  def station
    title = @stations_title.sample + rand(100).to_s
    @stations << Station.new(title)
    @stations.last
  end

  def train
    number = "#{rand(101..999)}-#{rand(11..99)}"
    new_train = nil
    case rand(2)
    when 0
      new_train = PassengerTrain.new(number, 'Empty')
    when 1
      new_train = CargoTrain.new(number, 'Empty')
    end
    rand(1..4).times { new_train.attach_carriage(carriage(new_train.type)) }
    @trains << new_train
    @trains.last
  end

  def carriage(type)
    number = rand(101..999).to_s + ('A'..'Z').to_a.sample
    case type
    when 'Passenger'
      @carriages << PassengerCarriage.new(number, 'Passenger')
    when 'Cargo'
      @carriages << CargoCarriage.new(number, 'Cargo')
    end
    @carriages.last
  end
end
