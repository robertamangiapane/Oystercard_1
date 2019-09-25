require 'oystercard'

describe Oystercard do
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }
  # --> Test not needed at the end of step10 as method moved to private
  # it 'deducts balance with given amount' do
  #   oyster = Oystercard.new
  #   oyster.top_up(10)
  #   oyster.deduct(5)
  #   expect(oyster.balance).to eq 5
  # end

  describe '#intialize' do
    # context 'balance is 0' do
      it 'displays 0' do
        expect(subject.balance).to eq 0
      end
    # end
      it 'starts with an empty list of journeys' do
        oyster = Oystercard.new
        expect(oyster.journeys).to be_empty
      end
  end

  describe '#top_up' do

    it 'tops up balance with given amount' do
      oyster = Oystercard.new
      oyster.top_up(5)
      expect(oyster.balance).to eq 5
    end

    it 'throws an error if balance is greater than £90' do
      oyster = Oystercard.new
      oyster.top_up(Oystercard::MAX_BALANCE)
      expect { oyster.top_up(1) }.to raise_error "Error: Cannot top up, balance exceeds Maximum Balance £#{Oystercard::MAX_BALANCE}"
    end

  end

  describe '#touch_out' do

    it 'deducts minimum balance on #touch_out' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      expect { oyster.touch_out(exit_station) }.to change { oyster.balance }.by(-Oystercard::MIN_BALANCE)
    end

    it 'clears entry_station on #touch_out' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.entry_station).to eq nil
    end

    it 'it records exit station on #touch_out' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.exit_station).to eq exit_station
    end

  end

  describe '#touch_in' do

    it 'throws an error if balance is less than £1' do
      oyster = Oystercard.new
      oyster.top_up(0.40)
      expect { oyster.touch_in(entry_station) }.to raise_error "Error: Cannot touch in, your balance is less than minimum balance £#{Oystercard::MIN_BALANCE}"
    end

    it 'it records entry station on #touch_in' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      expect(oyster.entry_station).to eq entry_station
    end

    it '#touch_in takes an arguement: entry station' do
      oyster = Oystercard.new
      expect(oyster).to respond_to(:touch_in).with(1).argument
    end
  end

  describe '#in_journey?' do

    it 'it tells us if the user is currently on a journey, #in_journey?' do
      oyster = Oystercard.new
      expect(oyster.in_journey?).to eq false
    end

    it 'tells us if the user is currently touched in' do
      oyster = Oystercard.new
      oyster.top_up(5) #min_balance step 9: added this line to pass min_balance test
      oyster.touch_in(entry_station)
      expect(oyster.in_journey?).to eq true
    end

    it 'tells us if the user is currently touched out' do
      oyster = Oystercard.new
      oyster.touch_out(exit_station)
      expect(oyster.in_journey?).to eq false
    end

  end

  describe '#journeys' do
    it 'it records last journey after #touch_in and #touch_out' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.journeys).to include({ :entry_station => :entry_station, :exit_station => :exit_station })
    end
  end

end
