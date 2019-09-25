class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
    # @in_journey = false
  end

  def top_up(amount)
    # @balance = @balance + amount
    raise "Error: Cannot top up, balance exceeds Maximum Balance £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance = @balance + amount
  end

  def in_journey?
    # @in_journey
    return true if @entry_station != nil
    false
    # @entry_station != nil
    # !!@entry_station
  end

  def touch_in(entry_station)
    raise "Error: Cannot touch in, your balance is less than minimum balance £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    # @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    # @balance =  @balance - MIN_BALANCE #--> replaced with the deduct method which is being moved to private in the next step
    deduct(MIN_BALANCE)
    # @in_journey = false
    @exit_station = exit_station
    save_journey
    @entry_station = nil
  end

  private

  def save_journey
    last_journey = { entry_station: @entry_station, exit_station: @exit_station}
    # p @entry_station
    @journeys << last_journey
  end

  def deduct(amount)
    @balance = @balance - amount
  end

  # def balance
  #   @balance
  # end

end
