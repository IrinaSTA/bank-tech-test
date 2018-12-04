# Simple checking account
class Account

  def initialize(statement_generator = Statement, balance = AccountBalance)
    @balance = balance.new
    @transactions = []
    @statement_generator = statement_generator
  end

  def show_balance
    balance.show
  end

  def deposit(amount, date = Time.now.to_i)
    balance.increase(amount)
    record_transaction(amount, date, :credit)
  end

  def withdraw(amount, date = Time.now.to_i)
    balance.decrease(amount)
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
      balance: balance.show
    )
  end

  def balance
    @balance
  end
end
