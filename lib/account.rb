require './lib/transaction'
require './lib/transaction_formatter'

class Account

  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(credit)
    check_argument(credit)
    @current_balance += credit
    @transactions << create_transaction('deposit', credit)
  end

  def withdraw(debit)
    check_argument(debit)
    check_available_funds(debit)
    @current_balance -= debit
    @transactions << create_transaction('withdraw', debit)
  end

  def print_statment
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      TransactionFormatter.new(transaction).display_transaction()
    end
  end

  private

  def check_argument(value)
    if !value.is_a? Integer
      stop_error_time('type')
    elsif value <= 0
      stop_error_time('type')
    end
  end

  def check_available_funds(debit)
    if self.current_balance < debit
      stop_error_time('funds')
    end
  end

  def stop_error_time(error)
    case error
    when 'type'
      raise TypeError, 'Must pass a postive number'
    when 'funds'
      raise StandardError, 'Unavailable funds'
    else
      raise StandardError, 'Error'
    end
  end

  def create_transaction(transaction_type, amount)
    case transaction_type
    when 'deposit'
      return(Transaction.new(amount, 0, @current_balance))
    when 'withdraw'
      return(Transaction.new(0, amount, @current_balance))
    else
      raise StandardError, 'Error, transaction type not recognised'
    end
  end

end
