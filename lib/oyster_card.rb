class OysterCard
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Exceeded maximum balance of £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    raise "Not enough money, current balance is £#{@balance}" if @balance - amount < 0
    @balance -= amount
  end
end
