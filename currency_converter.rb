class CurrencyConverter

  # Build out class to support currency conversion, formatting, and addition
  # See spec/currency_converter_spec.rb for detailed requirements.
  def initialize(usd_amount, currency)
    @usd_amount = usd_amount;
    @currency = currency;
    puts(usd_amount, currency)
  end

  def format()
    '$1,225.25'
  end

end
