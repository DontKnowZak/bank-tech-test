class Account

  attr_reader :current_balance

  def initialize
    @current_balance = 0
  end

  def deposit(credit)
    check_argument(credit)
    @current_balance += credit
  end

  def withdraw(debit)
    check_argument(debit)
    check_available_funds(debit)
    @current_balance -= debit
  end

  private

  def check_argument(value)
    if !value.is_a? Integer
      stop_error_time("type")
    elsif value <= 0
      stop_error_time("type")
    end
  end

  def check_available_funds(debit)
    if self.current_balance < debit
      stop_error_time("funds")
    end
  end

  def stop_error_time(error)
    case error
    when 'type'
      raise TypeError, "Must pass a postive number"
    when 'funds'
      raise StandardError, "Unavailable funds"
    end
  end

end
