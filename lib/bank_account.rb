class BankAccount
  
  attr_reader :name, :status, :balance
  
  attr_writer :status, :balance
  
  def initialize (name, status = "open", balance = 1000)
    @name = name
    @status = status
    @balance = balance
  end
  
  def deposit(input)
    self.balance += input
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    return true if self.status == "open" && self.balance > 0
    false
  end
  
  def close_account
    self.status = "closed"
  end
  
end