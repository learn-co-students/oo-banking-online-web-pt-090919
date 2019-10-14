require 'pry'
class Transfer
  
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if valid? && self.status != "complete" && @sender.balance >= @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      self.status = "complete"
    else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && self.status == "complete"
        @receiver.balance -= @amount
        @sender.balance += @amount
        self.status = "reversed"
    end
  end


end

