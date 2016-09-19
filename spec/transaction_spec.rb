require 'transaction'

describe Transaction do

  describe '#initialize' do

    context 'when a new transaction is made' do

      before do
        @subject = Transaction.new(1000, 0, 1000, "01/01/2016")
      end

      it 'has the current date' do
        expect(@subject.date).to eq "01/01/2016"
      end

      it 'has credit value' do
        expect(@subject.credit).to eq 1000
      end

      it 'has debit value' do
        expect(@subject.debit).to eq 0
      end

      it 'has balance value' do
        expect(@subject.balance).to eq 1000
      end

    end

    context 'when a new transaction is made' do

      before do
        @subject = Transaction.new(0, 2000, 0, "01/01/2016")
      end

      it 'has the current date' do
        expect(@subject.date).to eq "01/01/2016"
      end

      it 'has credit value' do
        expect(@subject.credit).to eq 0
      end

      it 'has debit value' do
        expect(@subject.debit).to eq 2000
      end

      it 'has balance value' do
        expect(@subject.balance).to eq 0
      end

    end

  end

end
