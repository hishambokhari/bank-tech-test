require 'account'

describe 'Account' do
  
  account = Account.new

  describe '#balance' do
    it 'opens up a bank account with zero balance' do
      expect(account.balance).to eq 0.00
    end
  end

  describe '#first_deposit' do
    it 'makes a deposit of 1000 on 10-01-2012' do
      expect(account.first_deposit).to eq 1000.00 
    end
  end
end



  