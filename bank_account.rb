class BankAccount
	@@interest_rate = 0.01
	@@accounts = []
	def initialize
		@balance = 0
	end
	def balance
		@balance
	end
	def set_balance(new_bal)
		@balance = new_bal
	end

	def deposit(number)
		@balance = @balance + number
	end

	def withdraw(number)
		if number< @balance 
			@balance = @balance - number
		end
	end

	def self.create
		account = BankAccount.new
		@@accounts << account
		return account
	end

	def self.total_funds
		sum = 0.0

		@@accounts.each do |current_acc|
			sum += current_acc.balance
		end
		return sum
	end

	def self.interest_time
		new_bal = 0
		@@accounts.each do |interest_bal|
			new_bal = interest_bal.balance + interest_bal.balance * @@interest_rate
			interest_bal.set_balance(new_bal)
		end
	end
end

my_account = BankAccount.create
your_account = BankAccount.create
# puts my_account.balance # 0
# puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
 puts my_account.balance # 200
 puts your_account.balance # 1000

 puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
