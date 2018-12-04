require 'account'
require 'pry'

describe 'Account' do

  let(:statement_class) { double('Statement') }
  let(:acct_balance_class) { double('AccountBalance') }
  let(:balance_instance) { instance_double('AccountBalance') }
  let(:account) { Account.new(statement_class, acct_balance_class) }
  let(:transactions) do
    [{ date: 1_543_871_218, credit: 1000.00, balance: 1000.00 },
     { date: 1_543_871_226, credit: 2000.00, balance: 3000.00 },
     { date: 1_543_871_241, debit: 500.00, balance: 2500.00 }]
  end

  before do
    allow(acct_balance_class).to receive(:new).and_return(balance_instance)
    allow(balance_instance).to receive(:show)
    allow(balance_instance).to receive(:increase)
    allow(balance_instance).to receive(:decrease)
  end

  it 'shows account balance' do
    expect(balance_instance).to receive(:show)
    account.show_balance
  end

  it 'can record a deposit' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    account.deposit(1000)
    allow(balance_instance).to receive(:show).and_return(1000)
    expect(account.show_balance).to eq(1000)
  end

  it 'can record a withdrawal' do
    time_now = Time.now
    allow(Time).to receive(:now).and_return(time_now)
    account.deposit(1000)
    account.withdraw(500)
    allow(balance_instance).to receive(:show).and_return(500)
    expect(account.show_balance).to eq(500)
  end

  it 'can produce a statement' do
    expect(statement_class).to receive(:display)
    account.statement
  end
end
