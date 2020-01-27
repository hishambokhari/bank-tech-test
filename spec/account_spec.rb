require 'account'

describe 'Account' do
  account = Account.new

  # As a user, 
  # so I can keep a check on my money,
  # I would like to make a bank account

  describe '#balance' do
    it 'opens up a bank account with zero balance' do
      expect(account.balance).to eq 0.00
    end
  end
end



  