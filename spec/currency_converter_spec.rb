require_relative '../currency_converter'

RSpec.describe CurrencyConverter do
  describe '#format' do
    it 'formats USD' do
      usd_amount = 1225.25
      result = CurrencyConverter.new(usd_amount, 'USD').format
      expect(result).to eq('$1,225.25')
    end

    it 'converts and formats USD to GBP' do
      usd_amount = 1225.25
      result = CurrencyConverter.new(usd_amount, 'GBP').format
      expect(result).to eq('£950.43')
    end

    it 'converts and formats USD to EUR' do
      usd_amount = 1225.25
      result = CurrencyConverter.new(usd_amount, 'EUR').format
      expect(result).to eq('€1.133,85')
    end

    it 'supports string inputs' do
      usd_amount = '1225.25'
      result = CurrencyConverter.new(usd_amount, 'USD').format
      expect(result).to eq('$1,225.25')
    end

    it 'supports string inputs' do
      usd_amount = '1225.25'
      result = CurrencyConverter.new(usd_amount, 'USD').format
      expect(result).to eq('$1,225.25')
    end

    it 'pads zeros on fractional cents' do
      usd_amount = 1225
      result = CurrencyConverter.new(usd_amount, 'USD').format
      expect(result).to eq('$1,225.00')
    end

    it 'returns nil if currency unsupported' do
      usd_amount = 1225.25
      result = CurrencyConverter.new(usd_amount, 'FOO').format
      expect(result).to be_nil
    end

    it 'returns nil if amount is non-numeric' do
      usd_amount = 'foo'
      result = CurrencyConverter.new(usd_amount, 'USD').format
      expect(result).to be_nil
    end
  end

  describe '.format' do
    it 'is same as #format' do
      usd_amount = 1225.25
      result = CurrencyConverter.format(usd_amount, 'USD')
      expect(result).to eq('$1,225.25')
    end
  end

  describe '.add' do
    it 'adds amounts and returns formatted total for given currency' do
      amounts = [100.25, 500.50, 900.90]
      result = CurrencyConverter.add(amounts, 'EUR')
      expect(result).to eq('€1.389,63')
    end

    it 'returns nil if currency unsupported' do
      amounts = [100.25, 500.50, 900.90]
      result = CurrencyConverter.add(amounts, 'FOO')
      expect(result).to be_nil
    end

    it 'returns nil if any amounts are non-numeric' do
      amounts = [100.25, 'foo', 900.90]
      result = CurrencyConverter.add(amounts, 'EUR')
      expect(result).to be_nil
    end

    it 'supports large floating point entries' do
      amounts = [0.1, 0.05, 1000000000000000.0]
      result = CurrencyConverter.add(amounts, 'USD')
      expect(result).to eq('$1,000,000,000,000,000.15')
    end
  end
end
