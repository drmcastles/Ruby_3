class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def cargo_trains
    trains(:cargo)
  end

  def passenger_trains
     trains(:passenger)
  end

  def trains_list(target)
    trains.select { |train| train.type == target }
  end
end

#для проверки
stationA = Station.new('station_1')
stationA.add_train('Green')
stationB = Station.new('station_2')
stationB.add_train('Red')


print "На станцию #{stationA.name} пребывает поезд #{stationA.trains[0].to_s}"
p stationA.object_id
