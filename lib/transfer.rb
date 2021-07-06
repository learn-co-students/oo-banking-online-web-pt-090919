class Transfer
  
  attr_reader :sender, :receiver, :status
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @transfer_amount = transfer_amount
    @status = "pending"
  end
  
  def amount
    @transfer_amount
  end
  
  def status=(status)
    @status = status
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    
    if @status == "pending"
    
      if self.valid? && @sender.balance > @transfer_amount
        @sender.balance=(@sender.balance - @transfer_amount)
        @receiver.balance=(@receiver.balance + @transfer_amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
        
      end
      
    else
      nil
    end
    
  end
  
  def reverse_transfer
  
    if @status == "complete"
      
      @sender.balance = @sender.balance + @transfer_amount
      @receiver.balance = @receiver.balance - @transfer_amount
      @status = "reversed"
      
    else
      nil
    end
  end
  
  
end
