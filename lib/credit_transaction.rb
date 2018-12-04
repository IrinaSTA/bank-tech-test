# Records a credit transaction
class CreditTransaction
  attr_reader :type, :amount, :timestamp

  def initialize(amount, timestamp = Time.now)
    @type = :credit
    @amount = amount
    @timestamp = timestamp
  end

  def record
    { date: @timestamp, @type => @amount }
  end
end
