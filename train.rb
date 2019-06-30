class Train
  attr_accessor :speed
  attr_reader :type, :carridge_count, :route
  def initialize
    @number = number
    @type = type
    @carridge_count = carridge_count
  end

  def add_speed=(new_speed)
    @speed += new_speed
  end

  def stop
    @speed = 0
  end

#цепляем/отцепляем вагон, если скорость не 0.
  def add_carridge
    if (@speed).zero?
        @carridge_count += 1
    end
  end

  def delete_carrige
    if (@speed).zero? && @carridge_count != 0
    @carridge_count -= 1
    end
  end

#Может принимать маршрут следования (объект класса Route).
  def current_route
    @route.stations
  end
#при назначении маршрута поезд помещается на 1 станцию
  def add_route(route)
    @route = route
    route.first_station.add_train(self)
  end

#текущуястанция
  def current_station
    current_route.find { |station| station.trains.include?(self) }
  end

  def move(direction)
    target_station = case direction
                     when :forward
                       next_station
                     when :backward
                       prev_station
                     end

    current_route[target_station].add_train(self)
  end


  def next_station
    return if current_station.nil?
    return current_station if current_route == @route.last_station

   current_route[index_for(current_station) + 1]
  end

  def prev_station
    return if current_station.nil?
    return current_station if current_station == @route.first_station

    current_route[index_for(current_station) - 1]
  end

  def index_for(station)
    current_route.index(station)
  end
end
