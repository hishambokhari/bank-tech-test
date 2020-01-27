require 'account'

describe '#deposit_display' do
  it 'displays a given amount in the correct format' do
    expect(deposit_display(1000)).to eq "1000.00"
    expect(deposit_display(2000)).to eq "2000.00"
    expect(deposit_display(3000)).to eq "3000.00"
    expect(deposit_display(100.53)).to eq "100.53"
  end

  it 'throws an error if the amount is an invalid amount' do
    expect(deposit_display(-2000)).to eq "Error: Invalid amount"
    expect(deposit_display(-50)).to eq "Error: Invalid amount"
  end
end




  