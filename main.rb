require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'сarriage'
require_relative 'menu_utils/print_obj'
require_relative 'menu_utils/text_menu'
require_relative 'menu_utils/exemple_obj'
require_relative 'menu_utils/user_print'

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

text_menu = TextMenu.new
text_menu.carriages = carriages
answer = 1

while answer != 0
  text_menu.invite
  answer = gets.to_i
  case answer
  when 1
    text_menu.make_station
  when 2
    text_menu.make_train
  when 3
    text_menu.make_route
  when 4
    text_menu.change_stations_in_route
  when 5
    text_menu.assign_route_to_train
  when 6
    text_menu.changes_in_train_carriage
  when 7
    text_menu.move_train
  when 8
    text_menu.view
  when 9
    exemple_obj = ExempleObj.new
    text_menu.routes = exemple_obj.routes
    text_menu.trains = exemple_obj.trains
    text_menu.stations = exemple_obj.stations
  end
end
