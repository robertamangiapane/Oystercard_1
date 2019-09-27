class Journey
  attr_reader :min_fare
  MIN_FARE = 1

  def initialize(min_fare = MIN_FARE)
    @min_fare = min_fare
  end

  def start(entry_station)
    entry_station
  end

  def end(exit_station)
    exit_station
  end

  def fare
    @min_fare
  end
end
