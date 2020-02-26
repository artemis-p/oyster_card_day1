# frozen_string_literal: true

class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :origin_station, :journey, :exit_station

  def initialize(balance = 0)
    @balance = balance
    @origin_station = nil
    @journey = []
    @exit_station = nil
  end

  def top_up(amount)
    raise "Exceeded maximum balance of £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MIN_BALANCE

    @origin_station = station
  end

  def in_journey
    if @origin_station.nil?
      false
    else
      true
    end
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @exit_station = station
    store_journey
    @origin_station = nil
  end

  def store_journey
    journey.push({origin_station: origin_station, exit_station: exit_station})
  end

  private

  def deduct(amount)
    raise "Not enough money, current balance is £#{@balance}" if @balance - amount < 0

    @balance -= amount
  end
end
