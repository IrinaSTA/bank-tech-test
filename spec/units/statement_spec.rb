require 'statement'

describe 'Statement' do
  let(:transactions) do
    [{ date: 1_543_871_218, credit: 1000.00, balance: 1000.00 },
     { date: 1_543_871_226, credit: 2000.00, balance: 3000.00 },
     { date: 1_543_871_241, debit: 500.00, balance: 2500.00 }]
  end

  it 'can generate a statement for an account' do
    statement = Statement.new(transactions)
    expect(statement.display).to eq("date || credit || debit || balance\n" \
      "03/12/2018 ||  || 500.00 || 2500.00\n" \
      "03/12/2018 || 2000.00 ||  || 3000.00\n" \
      "03/12/2018 || 1000.00 ||  || 1000.00\n")
  end
end
