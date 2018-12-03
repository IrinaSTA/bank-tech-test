# Simple checking account
class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    increase_balance(amount)
    record_transaction(amount, date, :credit)
  end

  def withdraw(amount, date)
    decrease_balance(amount)
    record_transaction(amount, date, :debit)
  end

  private

  def record_transaction(amount, date, type)
    if type == :credit
      credit = amount.to_f
      debit = nil
    else
      credit = nil
      debit = amount.to_f
    end
    @transactions.push(
      date: date,
      credit: credit,
      debit: debit,
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
