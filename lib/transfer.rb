class Transfer
  # your code here


  attr_accessor :sender, :receiver, :status, :amount
 
  def initialize(sender, receiver, status, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    sender.status == "open" && receiver.status == "open"
    sender.valid?
    receiver.valid?
  end 

  def execute_transaction 
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount 
      receiver.balance += amount 
      self.status = "complete"

    else
      reject_transfer
    end
  end

  def reverse_transfer 
    if valid? && sender.balance > amount && self.status == "completed"
      sender.balance += amount 
      receiver.balance -= amount 
      self.status = "reversed"

    else
      reject_transfer
    end
  end

  
    #def reverse_transfer 
    # valid? && sender.amount <=> sender.account && self.status == "pending"  
    # sender.balance != sender.account  
    #  self.status = "reversed"
    #end

    def reject_transfer
      self.status = "rejected"
      'Transaction rejected. Please check your account balance.'
    end

end
