require_relative 'oyster_card'
class Journey
  PENALTY_FARE = 6
  attr_reader :origin_station, :exit_station
  def initialize(station)
    @origin_station = station
    @exit_station
  end

  def complete?
    @exit_station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    !complete? ? PENALTY_FARE : OysterCard::MIN_BALANCE
     
  end
end