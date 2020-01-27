def deposit_display(amount)
  if amount < 0
      "Error: Invalid amount"
  else
    sprintf("%.2f", amount)
  end
end

def date_display(date)
  date.split("-").join("/")
end