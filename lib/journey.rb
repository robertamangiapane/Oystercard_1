class Journey

  attr_reader :min_fare, :penalty_fare

  MIN_FARE = 1
  PENALTY_FARE = 6


  def initialize
    @min_fare = MIN_FARE
    @penalty_fare = PENALTY_FARE
    @complete = false
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def complete?
    if @entry_station.nil? || @exit_station.nil?
      @complete
    else
      true
    end
  end

  def fare
    complete? ? @min_fare : @penalty_fare
  end
end
