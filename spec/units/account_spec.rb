require 'account'
require 'pry'

describe 'Account' do

  let(:statement_class) { double('Statement') }
  let(:account) { Account.new(statement_class) }
  let(:transactions) do
    [{ date: 1_543_871_218, credit: 1000.00, balance: 1000.00 },
     { date: 1_543_871_226, credit: 2000.00, balance: 3000.00 },
     { date: 1_543_871_241, debit: 500.00, balance: 2500.00 }]
  end

  it 'has a balance' do
    expect(account.balance).to eq(0)
  end

  it 'can record a deposit' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end

  it 'can record a withdrawal' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    account.deposit(1000)
    account.withdraw(500)
    expect(account.balance).to eq(500)
  end

  it 'can produce a statement' do
    expect(statement_class).to receive(:display)
    account.statement
  end
end
