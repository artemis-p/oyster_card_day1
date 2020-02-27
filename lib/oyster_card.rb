# frozen_string_literal: true
require_relative 'journey'

class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :journey, :journey_history

  def initialize(balance = 0)
    @balance = balance
    @journey = nil
    @journey_history = []
  end

  def top_up(amount)
    raise "Exceeded maximum balance of £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MIN_BALANCE

      deduct(Journey::PENALTY_FARE) if @journey
    
      @journey = Journey.new(station)

  end

  def in_journey
    !!@journey
  end

  def touch_out(station)
    if @journey
      @journey.finish(station)
      deduct(@journey.fare)
      store_journey
    else
      deduct(Journey::PENALTY_FARE)
    end
      @journey = nil
  end

  def store_journey
    journey_history.push({origin_station: journey.origin_station, exit_station: journey.exit_station})
  end

  private

  def deduct(amount)
    raise "Not enough money, current balance is £#{@balance}" if @balance - amount < 0

    @balance -= amount
  end
end
