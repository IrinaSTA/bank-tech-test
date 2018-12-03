class Account

  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    record_transaction(amount, date, :debit)
    increase_balance(amount)
  end

  def withdraw(amount, date)
    record_transaction(amount, date, :credit)
    decrease_balance(amount)
  end

  private

  def record_transaction(amount, date, type)
    @transactions.push({amount: amount, date: date, type: type})
  end

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end

end
