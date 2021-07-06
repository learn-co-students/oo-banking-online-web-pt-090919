class BankAccount
  
  attr_reader :name, :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(money)
   @balance = @balance + money
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def balance=(num)
    @balance = num
  end
  
  def status=(status)
    @status = status
  end
  
  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end

end
