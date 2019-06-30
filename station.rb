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

  def trains_list
    p @trains
  end


  def trains_list_for_type(target)
   p @trains.select { |train| train.type == target }
  end
end

