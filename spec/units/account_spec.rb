require 'account'

describe 'Account' do

  let(:account) { Account.new() }

  it 'has a balance' do
    expect(account.balance).to eq(0)
  end
end
