require 'debit_transaction'

describe 'Debit Transaction' do
  it 'can record amount, date and type' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    transaction = DebitTransaction.new(500)
    expect(transaction.type).to eq(:debit)
    expect(transaction.amount).to eq(500)
    expect(transaction.timestamp).to eq(time_now)
  end

  it 'has a record' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    transaction = DebitTransaction.new(500)
    expect(transaction.record).to eq(date: time_now, debit: 500)
  end
end
