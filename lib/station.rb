require 'csv'

class Station

attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  # def get_zone
  #   CSV.foreach('london_stations.csv') do |row|
  #     if row[0].downcase == @name.downcase
  #       return @zone = row[5].to_i
  #   end
  # end
end
