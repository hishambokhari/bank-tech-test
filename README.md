# bank-tech-test

Introduction:

A command line application to create a bank account, make deposits and withdrawals, and printing your statement. This README will breakdown some Installation Instructions followed by a How to use instructional

Installation Instruction:

1. Clone this repository from github then change directory into it.
2. Bundle install to install dependencies

How to use:

  From your command line:
1. Load the app in IRB using require 'account'
2. Create an account account = Account.new

3. To make a deposit: 
 - First add the date in the correct format e.g. account.add_date("10-01-2020")
 - Then, add the amount to deposit e.g £1000 would be account.deposit(1000)

4. To make a withdrawal:
 - First add the date in the correct format e.g. account.add_date("13-05-2020")
 - Then, deduct the amount to withdraw e.g. £1000 would be account.withdraw(500)

5. To print your statement, run account.statement.printer

Run Tests:

1. Run rspec from the command line to check tests. The app has 100% test coverage



Acceptance criteria:

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

User Stories:

As a user, 
so I can keep a check on my money,
I would like to make a bank account

As a user, 
so I can store money,
I would like to make a deposit of 1000 into my bank account on 10-01-2012

As a user, 
so I can store money,
I would like to make a deposit of 2000 into my bank account on 13-01-2012

As a user, 
so I can spend money,
I would like to make a withdrawal of 500 from my bank account on 14-01-2012

As a user, 
so that I can see a statement of all my transactions,
I would like to print a bank statement

As a user, 
so that I can track my bills/payments/spending,
I would like to see the date, amount in/out and my balance for each transaction on my bank statement.

