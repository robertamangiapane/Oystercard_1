require_relative 'journey'

class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Error: Cannot top up, balance exceeds Maximum Balance £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance = @balance + amount
  end

  def in_journey?
    # @in_journey
    return true if @entry_station != nil
    false
  end

  def touch_in(entry_station)
    raise "Error: Cannot touch in, your balance is less than minimum balance £#{MIN_BALANCE}" if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @exit_station = exit_station
    # save_journey
    @entry_station = nil
  end

  private

  # def save_journey
  #   last_journey = { entry_station: @entry_station, exit_station: @exit_station}
  #   # p @entry_station
  #   @journeys << last_journey
  # end

  def deduct(amount)
    @balance = @balance - amount
  end
end
