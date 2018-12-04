# Records a debit transaction
class DebitTransaction
  attr_reader :type, :amount, :timestamp

  def initialize(amount, timestamp = Time.now)
    @type = :debit
    @amount = amount
    @timestamp = timestamp
  end

  def record
    { date: @timestamp, @type => @amount }
  end
end
