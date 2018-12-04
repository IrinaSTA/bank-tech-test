# Simple checking account
class Account
  def initialize(
    statement_generator = Statement,
    balance = AccountBalance,
    increase = CreditTransaction,
    decrease = DebitTransaction
  )
    @balance = balance.new
    @transactions = []
    @statement_generator = statement_generator
    @decrease = decrease
    @increase = increase
  end

  def show_balance
    balance.show
  end

  def deposit(amount)
    balance.increase(amount)
    record_transaction(@increase.new(amount))
  end

  def withdraw(amount)
    balance.decrease(amount)
    record_transaction(@decrease.new(amount))
  end

  def statement
    @statement_generator.display(@transactions)
  end

  private

  def record_transaction(transaction)
    @transactions.push(
      date: transaction.timestamp,
      transaction.type => transaction.amount,
      balance: balance.show
    )
  end

  attr_reader :balance
end
