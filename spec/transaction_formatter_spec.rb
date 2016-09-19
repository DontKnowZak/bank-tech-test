require 'transaction_formatter'

describe TransactionFormatter do

  let(:transaction) {double(credit: 1000, debit: 0, date: '01/01/2016', balance: 1000)}

  subject(:presenter) { described_class.new(transaction) }

  it 'formats numbers to two decimals' do
    expect(presenter.credit).to eq ' 1000.00 '
    expect(presenter.balance).to eq ' 1000.00 '
  end

  it 'formats numbers to blank if 0' do
    expect(presenter.debit).to eq " "
  end

  describe '#display_transaction' do

    context 'if has 0 value for debit' do

      it 'prints line for transaction with blank space for debit' do
        expect{ presenter.display_transaction() }.to output("01/01/2016 || 1000.00 || || 1000.00 \n").to_stdout
      end

    end

  end

end
