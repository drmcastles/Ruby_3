class Train
  attr_accessor :speed
  attr_reader :type, :carridge_count, :route
  def initialize
    @number = number
    @type = type
    @carridge_count = carridge_count
  end

  def add_speed=(new_speed)
    @speed = new_speed
  end

  def stop
    @speed = 0
  end

#цепляем/отцепляем вагон, если скорость не 0.
  def update_carridge_count(action)
    if @speed != 0
      if action.to_s == :add
        @carridge_count += 1
      elsif action.to_s == :delete
        @carridge_count -= 1
      else
        puts "Неизвестная команда!"
      end
    else
        print "Действие невозвожно, "
        print "скорость не равна нулю!"
        puts
    end
  end
#принимает маршрут следования
 def current_route
    @route.stations
  end
#при назначении маршрута поезд помещается на 1 станцию
  def add_route(route)
    @route = route
    route.first_station.add_train(self)
  end

#добавляем маршрут с выбранной станцией
  def current_station
    current_route.find { |station| station.trains.include?(self) }
  end

def move(direction)
    leave_station

    target_station = case direction
                     when :forward
                       index_for(@prev_station) + 1
                     when :backward
                       index_for(@prev_station) - 1
                     end

    current_route[target_station].add_train(self)
  end

  def leave_station
    @prev_station = current_station
    current_station.trains.delete(self)
  end

  def next_station
    return if current_station.nil?
    return current_station if current_route == @route.last_station

   current_route[index_for(current_station) + 1]
    move(:forward)
  end

  def prev_station
    return if current_station.nil?
    return current_station if current_station == @route.first_station

    current_route[index_for(current_station) - 1]
    move(:backward)


  def index_for(station)
    current_route.index(station)
  end

  end
end
