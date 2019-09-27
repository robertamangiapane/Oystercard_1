class Journey

  attr_reader :min_fare, :penalty_fare, :complete, :journeys

  MIN_FARE = 1
  PENALTY_FARE = 6


  def initialize
    @min_fare = MIN_FARE
    @penalty_fare = PENALTY_FARE
    @complete = false
    @journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def completed_journey
    if @entry_station.nil? || @exit_station.nil?
      @complete = false
    else
      @complete = true
    end
  end

  def save_journey
    last_journey = { entry_station: @entry_station, exit_station: @exit_station }
    @journeys << last_journey
  end


  def fare
    completed_journey ? @min_fare : @penalty_fare
  end
end
