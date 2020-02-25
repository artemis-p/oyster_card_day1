class OysterCard
  MAX_BALANCE = 90
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeded maximum balance of £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    raise "Not enough money, current balance is £#{@balance}" if @balance - amount < 0
    @balance -= amount
  end

  def touch_in
   @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
  end
end
