require 'journey'

describe Journey do

  let(:journey) { described_class.new}
  let(:entry_station) { "aldgate" }
  let(:exit_station) { 'bank' }

  describe '#start' do
    it 'starts a journey and records entry_station' do
      expect(journey.start(entry_station)).to eq 'aldgate'
    end
  end

  describe '#end' do
    it "end a journey and records exit_station" do
      expect(journey.end(exit_station)).to eq 'bank'
    end
  end

  describe '#complete?' do
    it 'checks if journey has an entry_station and an exit_station' do
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.complete?).to eq true
    end

    it 'checks if journey has only entry_station' do
      journey.start(entry_station)
      expect(journey.complete?).to eq false
    end

    it 'checks if journey has only exit_station' do
      journey.end(exit_station)
      expect(journey.complete?).to eq false
    end
  end

  describe '#fare' do
    it 'charges a fare when entry_station and exit_station are present' do
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.fare).to eq journey.min_fare
    end
    it 'charges a penalty fare if entry_station or exit_station are not present' do
      journey.start(entry_station)
      expect(journey.fare).to eq journey.penalty_fare
    end
  end
end
