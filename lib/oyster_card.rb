class OysterCard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :in_journey

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeded maximum balance of £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

private
  def deduct(amount)
    raise "Not enough money, current balance is £#{@balance}" if @balance - amount < 0
    @balance -= amount
  end

public
  def touch_in
    raise "Insufficient funds" if @balance < MIN_BALANCE
   @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @balance -= MIN_BALANCE
    @in_journey = false
  end
end
