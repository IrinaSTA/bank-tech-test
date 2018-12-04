require 'account_balance'

describe 'Account Balance' do

  let(:balance) { AccountBalance.new }

  it 'has a starting balance of 0' do
    expect(balance.show).to eq(0)
  end

  describe '#show' do
    it 'shows balance' do
      balance.increase(1000)
      expect(balance.show).to eq(1000)
    end
  end

  describe '#increase' do
    it 'increases balance' do
      balance.increase(1000)
      expect(balance.show).to eq(1000)
    end
  end

  describe '#decrease' do
    it 'decreases balance' do
      balance.increase(1000)
      balance.decrease(500)
      expect(balance.show).to eq(500)
    end
  end
end
