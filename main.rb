require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'menu_utils/print_obj'
require_relative 'menu_utils/text_menu'
require_relative 'menu_utils/example_obj'
require_relative 'menu_utils/user_print'
require_relative 'company'
require_relative 'instance_counter'

text_menu = TextMenu.new
text_menu.process

# us_print = UserPrint.new
# ex_obj = ExampleObj.new
# ex_obj.route
# trains = ex_obj.trains
# stations = ex_obj.stations
# route = ex_obj.routes

# puts stations
# us_print.station(stations[0])

# trains.each do |train|
#   train.action_over_carriage { |carriage| us_print.carriage(carriage) }
#   puts ''
# end
#
# stations.each do |station|
#   us_print.station(station)
#   station.action_over_train { |train| us_print.train(train) }
# end