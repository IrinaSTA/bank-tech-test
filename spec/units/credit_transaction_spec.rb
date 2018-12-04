require 'credit_transaction'

describe 'Credit Transaction' do
  it 'can record amount, date and type' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    transaction = CreditTransaction.new(1000)
    expect(transaction.type).to eq(:credit)
    expect(transaction.amount).to eq(1000)
    expect(transaction.timestamp).to eq(time_now)
  end

  it 'has a record' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    transaction = CreditTransaction.new(1000)
    expect(transaction.record).to eq(date: time_now, credit: 1000)
  end
end
