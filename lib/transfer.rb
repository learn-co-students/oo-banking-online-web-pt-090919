class Transfer
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    if @status == "pending"
      if valid? && sender.balance >= @amount
        @status = "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
      else
        @status = "rejected"
        p "Transaction rejected. Please check your account balance."
      end
    else
      p "This transaction has already been completed!"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
