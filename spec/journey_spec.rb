require 'journey'

describe Journey do

  let (:journey) { described_class.new}
  let (:entry_station) { "aldgate" }

  describe '#start' do
    it "starts a journey and records entry_station" do
      expect(journey.start(entry_station)).to eq "aldgate"
    end
  end

  # describe '#end' do
  #
  # end
  #
  # describe '#fare' do
  #
  # end
end
