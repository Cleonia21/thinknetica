class TextMenu
  attr_accessor :routes, :stations, :trains, :carriages

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
    @print_obj = PrintObj.new
    @user_print = UserPrint.new
  end

  def invite
    puts 'enter  1: make station'
    puts 'enter  2: make train'
    puts 'enter  3: make route'
    puts 'enter  4: changing stations in the route'
    puts 'enter  5: assign route to train'
    puts 'enter  6: changes in train wagon'
    puts 'enter  7: move train'
    puts 'enter  8: view objects'
    puts 'enter  9: create a completed database of objects'
    puts 'enter  0: exit the program'
  end

  # 1
  def make_station
    @stations << Station.new(puts_gets_return('write station title').chomp)
    puts 'was make station:'
    @print_obj.station(@stations[-1])
    puts_gets_return('push to continue')
  end

  # 2
  def make_train
    number = puts_gets_return('write train number').to_i
    type = puts_gets_return('write train type').chomp
    puts 'enter 1: make train'
    puts 'enter 2: make cargo train'
    puts 'enter 3: make passenger train'
    answer = gets.to_i
    @trains << Train.new(number, type) if answer == 1
    @trains << CargoTrain.new(number, type) if answer == 2
    @trains << PassengerTrain.new(number, type) if answer == 3
    puts 'was make train:' if [1, 2, 3].include?(answer)
    @print_obj.train(@trains[-1]) if [1, 2, 3].include?(answer)
    puts_gets_return('push to continue')
  end

  # 3
  def make_route
    first = Station.new(puts_gets_return('write first station title').chomp)
    last = Station.new(puts_gets_return('write last station title').chomp)
    @stations << first << last
    @routes << Route.new(first, last)
    puts 'was make route:'
    @print_obj.route(@routes[-1])
    puts_gets_return('push to continue')
  end

  # 4
  def change_stations_in_route
    return puts_gets_return('no routes') if @routes[0].nil?

    route_i = @print_obj.routes(@routes)
    return puts_gets_return('incorrect input') if @routes[route_i].nil?

    case puts_gets_return('add/dell - 1/2').to_i
    when 1
      return puts_gets_return('no stations') if @stations[0].nil?

      station_i = @print_obj.stations(@stations)
      return puts_gets_return 'incorrect input' if @stations[station_i].nil?

      @routes[route_i].add_station(@stations[station_i])
    when 2
      station_i = @print_obj.stations(@routes[route_i].stations)
      return puts_gets_return 'incorrect input' if @routes[route_i].stations[station_i].nil?

      @routes[route_i].delete_station(@routes[route_i].stations[station_i])
    end
    puts "#{@routes[route_i]} stations now:"
    @user_print.stations(@routes[route_i].stations)
    puts_gets_return('push to continue')
  end

  # 5
  def assign_route_to_train
    return puts_gets_return('no trains') if @trains[0].nil?

    train_i = @print_obj.trains(@trains)
    return puts_gets_return('no routes') if @routes[0].nil?

    route_i = @print_obj.routes(@routes)
    return puts_gets_return('incorrect input') if @trains[train_i].nil? || @routes[route_i].nil?

    @trains[train_i].route = @routes[route_i]
    puts_gets_return('push to continue')
  end

  # 6
  def changes_in_train_carriage
    return puts_gets_return('no trains') if @trains[0].nil?

    train_i = @print_obj.trains(@trains)
    return puts_gets_return('incorrect input') if @trains[train_i].nil?

    case puts_gets_return('unhook/attach - 1/2').to_i
    when 1
      return puts_gets_return('no carriage') if @trains[train_i].carriages[0].nil?

      carriage_i = @print_obj.carriages(@trains[train_i].carriages)
      return puts_gets_return('incorrect input') if @trains[train_i].carriages[carriage_i].nil?

      @trains[train_i].unhook_carriage(@trains[train_i].carriages[carriage_i])
    when 2
      carriage_i = @print_obj.carriages(@carriages)
      return puts_gets_return 'incorrect input' if @carriages[carriage_i].nil?
      return puts_gets_return 'type incompatibility' if @carriages[carriage_i].type != @trains[train_i].type

      @trains[train_i].attach_carriage(@carriages[carriage_i])
    end
    puts "#{@trains[train_i]} carriage now:"
    @user_print.carriages(@trains[train_i].carriages)
    puts_gets_return('push to continue')
  end

  # 7
  def move_train
    return puts_gets_return('no trains') if @trains[0].nil?

    train_i = @print_obj.trains(@trains)
    return puts_gets_return 'incorrect input' if @trains[train_i].nil?
    return puts_gets_return 'train has no route' if @trains[train_i].route.nil?

    @print_obj.route(@trains[train_i].route)
    puts 'now the train is at the station:'
    @print_obj.station(@trains[train_i].station)
    case puts_gets_return 'move back/forward - 1/2'.to_i
    when 1
      trains[train_i].move_back
    when 2
      trains[train_i].move_forward
    end
    puts 'now the train is at the station:'
    @print_obj.station(@trains[train_i].station)
    gets
  end

  # 8
  def view
    puts 'enter 1: view stations'
    puts 'enter 2: view trains'
    puts 'enter 3: view routes'
    puts 'enter 4: view stations in the route'
    puts 'enter 5: view train int the station'
    case gets.to_i
    when 1
      return puts_gets_return 'no stations' if @stations[0].nil?

      @user_print.stations(@stations)
    when 2
      return puts_gets_return 'no trains' if @trains[0].nil?

      @user_print.trains(@trains)
    when 3
      return puts_gets_return 'no routes' if @routes[0].nil?

      @user_print.routes(@routes)
    when 4
      return puts_gets_return 'no routes' if @routes[0].nil?

      @user_print.routes(@routes)
    when 5
      return puts_gets_return 'no stations' if @stations[0].nil?

      station_i = @print_obj.stations(@stations)
      @user_print.train_in_the_station(@stations[station_i])
    end
    gets
  end

  private

  def puts_gets_return(puts_text)
    puts puts_text
    gets
  end
end
