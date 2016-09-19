class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(credit, debit, balance, date = current_date())
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  private

  def current_date
    date = Time.new
    date = format_date_value(date.day.to_s) + "/" + format_date_value(date.month.to_s) + "/" + date.year.to_s
  end

  def format_date_value(date_value)
    if date_value.length == 1
      return "0" + date_value
    else
      return date_value
    end
  end
end
