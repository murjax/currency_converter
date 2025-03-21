require_relative '../currency_converter'

RSpec.describe CurrencyConverter do
  describe '#format' do
    let(:usd_amount) { 1225.25 }
    let(:currency) { 'USD' }

    subject { described_class.new(usd_amount, currency).format }

    context 'formats USD' do
      it { is_expected.to eq('$1,225.25') }
    end

    context 'convert and format USD to GBP' do
      let(:currency) { 'GBP' }

      it { is_expected.to eq('£950.43') }
    end

    context 'convert and format USD to EUR' do
      let(:currency) { 'EUR' }

      it { is_expected.to eq('€1.133,85') }
    end

    # context 'support string inputs' do
    #   let(:usd_amount) { '1225.25' }

    #   it { is_expected.to eq('$1,225.25') }
    # end

    context 'pad zeros on fractional cents' do
      let(:usd_amount) { 1225 }

      it { is_expected.to eq('$1,225.00') }
    end

    # context 'return nil when currency unsupported' do
    #   let(:currency) { 'FOO' }

    #   it { is_expected.to be_nil }
    # end

    # context 'return nil when amount is non-numeric' do
    #   let(:usd_amount) { 'foo' }

    #   it { is_expected.to be_nil }
    # end
  end

  # describe '.format' do
  #   subject { described_class.format(usd_amount, currency) }

  #   context 'point to #format' do
  #     let(:usd_amount) { 1225.25 }
  #     let(:currency) { 'USD' }

  #     it { is_expected.to eq('$1,225.25') }
  #   end
  # end

  # describe '.add' do
  #   let(:amounts) { [100.25, 500.50, 900.90] }
  #   let(:currency) { 'USD' }

  #   subject { described_class.add(amounts, currency) }

  #   context 'add amounts and return formatted total for given currency' do
  #     let(:currency) { 'EUR' }

  #     it { is_expected.to eq('€1.389,63') }
  #   end

  #   context 'return nil when currency unsupported' do
  #     let(:currency) { 'FOO' }

  #     it { is_expected.to be_nil }
  #   end

  #   context 'return nil when any amounts are non-numeric' do
  #     let(:amounts) { [100.25, 'foo', 900.90] }

  #     it { is_expected.to be_nil }
  #   end

  #   context 'support large floating point entries' do
  #     let(:amounts) { [0.1, 0.05, 1000000000000000.0] }

  #     it { is_expected.to eq('$1,000,000,000,000,000.15') }
  #   end
  # end
end
