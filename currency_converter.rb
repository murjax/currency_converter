class CurrencyConverter

  # Build out class to support currency conversion, formatting, and addition
  # See spec/currency_converter_spec.rb for detailed requirements.

  ## 1. allow the new command to be invoked for this class by adding an initialize function.
  def initialize(amount, currency)
    ## 2. set class scoped variables.
    @amount = amount;
    @currency = currency;
    # puts(amount, currency)
  end

  def format()
    ## string interpolation to show the currency presented.
    ## test will fail because no comma.
    "$#{@amount}"
  end

end
