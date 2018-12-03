require 'account'

describe 'Account' do

  let(:account) { Account.new() }

  it 'has a balance' do
    expect(account.balance).to eq(0)
  end

  it 'can take a deposit on a specified date' do
    account.deposit(1000, '10/01/2012')
    expect(account.balance).to eq(1000)
  end

  it 'can make a withdrawal on a specified date' do
    account.deposit(1000, '10/01/2012')
    account.withdraw(500, '14/01/2012')
    expect(account.balance).to eq(500)
  end
end
