class Journey

  attr_reader :min_fare, :penalty_fare, :complete, :entry_station

  MIN_FARE = 1
  PENALTY_FARE = 6


  def initialize(entry_station)
    @min_fare = MIN_FARE
    @penalty_fare = PENALTY_FARE
    @complete = false
    @entry_station = entry_station
  end

  # def start(entry_station)
  #   @entry_station = entry_station
  # end

  def end(exit_station)
    @exit_station = exit_station
  end

  def completed_journey
    if @entry_station.nil? || @exit_station.nil?
      @complete = false
    else
      @complete = true
    end
    # @entry_station = nil
    # @exit_station = nil
  end

  def fare
    @complete ? @min_fare : @penalty_fare
  end
end
