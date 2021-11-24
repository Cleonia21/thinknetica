require_relative 'user_print'

class PrintObj < UserPrint
  def stations(stations)
    puts 'stations:'
    super
    puts 'write station number'
    gets.to_i - 1
  end

  def trains(trains)
    puts 'trains:'
    super
    puts 'write train number'
    gets.to_i - 1
  end

  def routes(routes)
    puts 'routes:'
    super
    puts 'write route number'
    gets.to_i - 1
  end

  def carriages(carriges)
    puts 'carriges:'
    super
    puts 'write carrige number'
    gets.to_i - 1
  end
end
