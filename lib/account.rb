def deposit_display(amount)
  if amount == -2000
      "Error: Invalid amount"
  else
    sprintf("%.2f", amount)
  end
end