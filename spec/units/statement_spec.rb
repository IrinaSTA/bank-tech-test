require 'statement'

describe 'Statement' do
  let(:transactions) do
    [{ date: '10/01/2012', credit: 1000.00, balance: 1000.00 },
     { date: '13/01/2012', credit: 2000.00, balance: 3000.00 },
     { date: '14/01/2012', debit: 500.00, balance: 2500.00 }]
  end

  it 'can generate a statement for an account' do
    statement = Statement.new(transactions)
    expect(statement.display).to eq("date || credit || debit || balance\n" \
      "14/01/2012 ||  || 500.00 || 2500.00\n" \
      "13/01/2012 || 2000.00 ||  || 3000.00\n" \
      "10/01/2012 || 1000.00 ||  || 1000.00\n")
  end
end
