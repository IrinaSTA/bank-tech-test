# Formats and displays an account statement
class Statement
  def initialize; end

  def self.display(transactions)
    header + body(transactions)
  end

  class << self
    private

    def header
      "date || credit || debit || balance\n"
    end

    def body(transactions)
      sorted_by_date(transactions)
        .map { |transaction| format_line(transaction) }.join
    end

    def sorted_by_date(transactions)
      transactions.sort { |a, b| b[:date] <=> a[:date] }
    end

    def format_line(transaction)
      "#{format_date(transaction[:date])} || " \
        "#{format_currency(transaction[:credit])} || " \
        "#{format_currency(transaction[:debit])} || " \
        "#{format_currency(transaction[:balance])}\n"
    end

    def format_currency(amount)
      format(format('%.2f', amount)) if amount
    end

    def format_date(timestamp)
      Time.at(timestamp).strftime('%d/%m/%Y')
    end
  end
end
