class Transfer
  
  attr_accessor :status, :last_trans
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    if @sender.valid? and @receiver.valid?
      true 
    else
      false 
    end
  end
  
  def execute_transaction
    if valid? and @status == 'pending' and @sender.balance >= @amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
    else 
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = 'reversed'
    else
    end
  end
  
end
