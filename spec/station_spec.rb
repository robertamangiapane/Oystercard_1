require 'station'

describe Station do

  let(:station) { described_class.new(:name, :zone) }

  describe '#initialize' do
    it 'station has a name' do
      # station = Station.new(:name, :zone)
      expect(station.name).to eq :name
    end

    it 'station has a zone' do
      # station = Station.new(:name, :zone)
      expect(station.zone).to eq :zone
    end
  end

end
