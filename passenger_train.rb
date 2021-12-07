class PassengerTrain < Train
  def initialize(number, type)
    super
    @type = 'Passenger'
  end
end