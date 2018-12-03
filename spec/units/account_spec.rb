require 'account'

describe 'Account' do
  let(:account) { Account.new }

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
end
