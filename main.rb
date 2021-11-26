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
require_relative 'company'
require_relative 'instance_counter'

# text_menu = TextMenu.new
# text_menu.process

Station.new('jkev')
Station.new('jkev')
Station.new('jkev')
Station.new('jkev')
Station.new('jkev')
Train.new(123, 'cw')
Route.new('3123', '1231')
Route.new('3123', '1231')
Route.new('3123', '1231')

puts Station.instances
puts Train.instances
puts Route.instances
