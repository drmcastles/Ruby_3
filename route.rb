class Route
  attr_reader :first_station, :intermediate_stations, :last_station
  def initialize(fisrt_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = []
  end

   def add_intermediate_station(station)
    @intermediate_stations << station
  end

  def remove_intermediate_station(station)
    @intermediate_stations.delete(station)
  end

  def stations
    stations = [first_station, intermediate_stations, last_station].flatten
  end
end
