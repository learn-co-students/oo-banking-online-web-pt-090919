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
    new_transfer = Transfer.new(sender, receiver, status = "pending", amount)
    if valid? && self.status != "complete" && new_transfer.sender.balance >= new_transfer.amount
      new_transfer.receiver.balance += new_transfer.amount
      new_transfer.sender.balance -= new_transfer.amount
      self.status = "complete"
    else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end
   
   
   
   
   
  #   # elsif valid? 
  #   #   self.status = "rejected"
  #   else !valid? && new_transfer.sender.balance >= new_transfer.amount
  #     self.status = "Transaction rejected. Please check your account balance."
  #   end
  # end
  
  def reverse_transfer
    reverse_transfer = Transfer.new(sender, receiver, status, amount)
    if valid? && self.status == "complete"
        reverse_transfer.receiver.balance -= reverse_transfer.amount
        reverse_transfer.sender.balance += reverse_transfer.amount
        self.status = "reversed"
    end
  end

  
end

