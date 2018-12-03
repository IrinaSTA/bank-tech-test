require 'spec_helper'

describe 'Bank Statement Feature', type: :feature do
  scenario 'Print out bank statement' do
    given_deposit_of_1000_on_10012012
    given_deposit_of_2000_on_13012012
    given_withdrawal_of_500_on_14012012
    client_should_have_correct_bank_statement
  end

  def given_deposit_of_1000_on_10012012
    @account = Account.new
    @account.deposit(1000, '10/01/2012')
  end

  def given_deposit_of_2000_on_13012012
    @account.deposit(2000, '13/01/2012')
  end

  def given_withdrawal_of_500_on_14012012
    @account.withdraw(500, '14/01/2012')
  end

  def client_should_have_correct_bank_statement
    expect(@account.statement).to eq("date || credit || debit || balance
                                \n14/01/2012 || || 500.00 || 2500.00
                                \n13/01/2012 || 2000.00 || || 3000.00
                                \n10/01/2012 || 1000.00 || || 1000.00")
  end
end
