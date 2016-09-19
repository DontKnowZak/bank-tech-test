class TransactionFormatter

  def initialize(transaction)
    @transaction = transaction
  end

  def display_transaction
    puts self.date + " ||"+ self.credit + "||" + self.debit + "||" + self.balance
  end

  def credit
    format_number(@transaction.credit)
  end

  def debit
    format_number(@transaction.debit)
  end

  def balance
    format_number(@transaction.balance)
  end

  def date
    @transaction.date
  end

  private

  def format_number(number)
    return " " if number == 0
    sprintf(' %.2f ', number)
  end
end
