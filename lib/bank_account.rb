class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    self.status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
   self.status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
