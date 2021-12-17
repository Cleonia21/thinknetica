class CargoTrain < Train
  def initialize(number, type)
    super
    @type = 'Cargo'
  end
end