# Stores account balance
class AccountBalance

  def initialize
    @balance = 0
  end

  def show
    @balance.to_f
  end

  def increase(amount)
    @balance += amount
  end

  def decrease(amount)
    @balance -= amount
  end

end
