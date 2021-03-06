require 'account'
describe Bank do
  
  describe '#money_format' do
    it 'displays a given amount in the correct format' do
      subject.deposit(3000)
      subject.add_date("10-01-2012")
      subject.confirm
      expect(subject.entries[0]).to include "3000.00"
    end
  end

  describe '#add_date' do
    it 'returns the date in the correct format' do
      expect(subject.add_date("10-01-2012")).to eq "10/01/2012"
     end
  end

  describe '#deposit' do
    it 'returns a given amount' do
      expect(subject.deposit(1000)).to eq 1000
    end
  end

  describe '#balance' do
    it 'returns the current balance when an amount is deposited to it' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect(subject.balance).to eq 3000
    end

    it 'raises an if given amount is an invalid amount' do
      expect{subject.deposit(-3000)}.to raise_error("Error: Invalid amount")
    end

    it 'raises an error if given amount is incorrect format' do
      expect{subject.deposit("3000")}.to raise_error("Error: Incorrect format")
    end

  end

  describe '#withdraw' do
    it 'takes out a given amount, returning the total balance remaining' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      subject.withdraw(500)
      subject.add_date("14-01-2012")
      subject.confirm
      expect(subject.balance).to eq 2500
    end

    it 'raises an if given amount is an invalid amount' do
      expect{subject.withdraw(-3000)}.to raise_error("Error: Invalid amount")
    end

    it 'raises an error if given amount is incorrect format' do
      expect{subject.withdraw("3000")}.to raise_error("Error: Incorrect format")
    end

  end

  describe '#last_deposit' do
    it 'returns the last deposit made' do
      subject.deposit(1000)
      subject.deposit(2000)
      expect(subject.last_deposit).to eq 2000
    end
  end

  describe '#last_date' do
  it 'displays the latest entry date' do
    subject.deposit(1000)
    subject.add_date("10/01/2012")
    subject.deposit(2000)
    subject.add_date("13/01/2012")
    expect(subject.last_date).to eq "13/01/2012"
  end
end

  describe '#display_entry' do
    it 'displays a deposit entry in the correct format' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      expect(subject.entries).to include "10/01/2012 || 1000.00 || || 1000.00"
    end

    it 'displays a withdrawal entry in the correct format' do
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect(subject.entries).to include "13/01/2012 || 2000.00 || || 2000.00"
    end
  end

 

  describe '#confirm' do
    it 'saves the deposit and date as an entry' do
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect(subject.entries).to eq ["13/01/2012 || 2000.00 || || 2000.00"]
    end
  end

  describe '#print_statement' do
    it 'shows the deposit, prints date, amount and balance with header' do
      subject.deposit(1000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n13/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when two deposits are made, prints statement daye, amount and balance' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when deposit and withdraw, prints statement date, amount and balance' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      subject.withdraw(500)
      subject.add_date("14-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end




  