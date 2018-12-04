# Simple checking account
class Account
  attr_reader :balance

  def initialize(statement_generator = Statement)
    @balance = 0
    @transactions = []
    @statement_generator = statement_generator
  end

  def deposit(amount, date = Time.now.to_i)
    increase_balance(amount)
    record_transaction(amount, date, :credit)
  end

  def withdraw(amount, date = Time.now.to_i)
    decrease_balance(amount)
    record_transaction(amount, date, :debit)
  end

  def statement
    @statement_generator.display(@transactions)
  end

  private

  def record_transaction(amount, date, type)
    @transactions.push(
      date: date,
      type => amount,
      balance: @balance.to_f
    )
  end

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end
end
