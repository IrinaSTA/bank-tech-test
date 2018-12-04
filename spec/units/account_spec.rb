require 'account'

describe 'Account' do
  let(:statement_class) { double('Statement') }
  let(:acct_balance_class) { double('AccountBalance') }
  let(:balance_instance) { instance_double('AccountBalance') }
  let(:credit_instance) { instance_double('CreditTranscation') }
  let(:debit_instance) { instance_double('DebitTranscation') }
  let(:increase_class) { double('CreditTransaction') }
  let(:decrease_class) { double('DebitTransaction') }
  let(:account) do
    Account.new(statement_class, acct_balance_class,
                increase_class, decrease_class)
  end
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
    allow(increase_class).to receive(:new).and_return(credit_instance)
    allow(decrease_class).to receive(:new).and_return(debit_instance)
  end

  it 'shows account balance' do
    expect(balance_instance).to receive(:show)
    account.show_balance
  end

  it 'can record a deposit' do
    expect(balance_instance).to receive(:increase)
    expect(credit_instance).to receive(:timestamp)
    expect(credit_instance).to receive(:type)
    expect(credit_instance).to receive(:amount)
    account.deposit(1000)
  end

  it 'can record a withdrawal' do
    expect(balance_instance).to receive(:decrease)
    expect(debit_instance).to receive(:timestamp)
    expect(debit_instance).to receive(:type)
    expect(debit_instance).to receive(:amount)
    account.withdraw(500)
  end

  it 'can produce a statement' do
    expect(statement_class).to receive(:display)
    account.statement
  end
end
