require 'money'
require 'json'

# explicitly define locales
I18n.config.available_locales = :en
Money.locale_backend = :currency



class CurrencyConverter
  def self.handleAmount(amount)
    return Float(amount) * 100 rescue nil if amount.is_a? String
    Integer(amount  * 100) rescue nil;
  end
  # Build out class to support currency conversion, formatting, and addition
  # See spec/currency_converter_spec.rb for detailed requirements.

  ## 1. allow the new command to be invoked for this class by adding an initialize function.
  def initialize(amount, currency)
    ## 2. set class scoped variables.
    @amount = self.class.handleAmount(amount)
    @currency = currency;
  end

  def self.chart()
    # https://hackernoon.com/ruby-how-to-readwrite-json-file-a23h3vxa
    _file = File.read('./conversion_chart.json')
    @data_hash = JSON.parse(_file)
  end

  def format()
    self.class.doFormatting(@amount, @currency)
  end

  def self.format(amount, currency)
    _amount = handleAmount(amount)
    _currency = currency;
    doFormatting(_amount, _currency)
  end

  def self.add(amounts, currency)
    _amountsCents = amounts.map { |amount| handleAmount(amount) }
    _amount =  _amountsCents.sum rescue nil;

    _currency = currency;
    doFormatting(_amount, _currency)
  end



  def self.doFormatting(amount, currency)
    begin
    ## string interpolation to show the currency presented.
    ## test will fail because no comma.
    # "$#{@amount}"

    ## Bring in money library

    ## Regarding Variables in Ruby
    # +------------------+----------------------+
    # | Name Begins With |    Variable Scope    |
    # +------------------+----------------------+
    # | $                | A global variable    |
    # | @                | An instance variable |
    # | [a-z] or _       | A local variable     |
    # | [A-Z]            | A constant           |
    # | @@               | A class variable     |
    # +------------------+----------------------+

    ## We are always using usd amount.
    return nil if(amount.nil?)
    _amount = Money.from_cents(amount, 'USD')
    _amount.format()

    ## We may or may not convert to another amount.
    ## Symmetric Properties - if a usd amount is converted to usd the value should not change.

    chart
    _val = @data_hash[currency]

    Money.default_bank.add_rate('USD', currency, _val)
    _finalAmount = _amount.exchange_to(currency).format
    rescue
      nil
    end
  end

end
