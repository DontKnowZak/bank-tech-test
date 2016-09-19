require 'account'

describe Account do

  describe '#initialize' do

    context 'when a new account is made' do

      it 'has a balance of 0' do
        expect(subject.current_balance).to eq 0
      end

      it 'has an empty transactions array' do
        expect(subject.transactions).to eq []
      end

    end

  end

  describe '#deposit' do

    context 'when a positive number argument is passed' do

      it 'the balance is increased by the amount' do
        subject.deposit(1000)
        expect(subject.current_balance).to eq 1000
      end

      it 'the balance is increased by the amount' do
        subject.deposit(2000)
        expect(subject.current_balance).to eq 2000
      end

      it 'the transaction array is passed a transaction' do
        subject.deposit(2000)
        expect(subject.transactions.length).to eq 1
      end

    end

    context 'when a negative number argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.deposit(-1000) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

      it 'throw error "must be postive number"' do
        expect{ subject.deposit(-1) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when zero is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.deposit(0) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when not-a-number argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.deposit('Hello World!') }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

      it 'throw error "must be postive number"' do
        expect{ subject.deposit(true) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when no argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.deposit() }.to raise_error(ArgumentError)
        expect(subject.current_balance).to eq 0
      end

    end

  end

  describe '#withdraw' do

    context 'when a positive number argument is passed' do

      context 'if account does have available balance' do

        before(:each) { subject.deposit(2000) }

        it 'the balance is decreased by the amount' do
          subject.withdraw(1000)
          expect(subject.current_balance).to eq 1000
        end

        it 'the balance is decreased by the amount' do
          subject.withdraw(2000)
          expect(subject.current_balance).to eq 0
        end

        it 'the transaction array is passed a transaction' do
          subject.withdraw(2000)
          expect(subject.transactions.length).to eq 2
        end

      end

      context 'if account does not have available balance' do

        it 'unavailable funds error' do
          expect{ subject.withdraw(1000) }.to raise_error(StandardError, 'Unavailable funds')
          expect(subject.current_balance).to eq 0
        end

        it 'unavailable funds error' do
          expect{ subject.withdraw(2000) }.to raise_error(StandardError, 'Unavailable funds')
          expect(subject.current_balance).to eq 0
        end

      end

    end

    context 'when a negative number argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.withdraw(-1000) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

      it 'throw error "must be postive number"' do
        expect{ subject.withdraw(-1) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when zero is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.withdraw(0) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when not-a-number argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.withdraw('Hello World!') }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

      it 'throw error "must be postive number"' do
        expect{ subject.deposit(true) }.to raise_error(TypeError)
        expect(subject.current_balance).to eq 0
      end

    end

    context 'when no argument is passed' do

      it 'throw error "must be postive number"' do
        expect{ subject.withdraw() }.to raise_error(ArgumentError)
        expect(subject.current_balance).to eq 0
      end

    end

  end

  describe '#print_statment' do

    context 'with no transactions' do

      it 'will print a empty statement' do
        expect{ subject.print_statment() }.to output("date || credit || debit || balance\n").to_stdout
      end

    end

    context 'with a deposit of 1000' do
      it 'will print a statement containing the statement' do
        subject.instance_variable_set(:@transactions, [Transaction.new(1000, 0, 1000, '19/09/2016')])
        expect{ subject.print_statment() }.to output("date || credit || debit || balance\n19/09/2016 || 1000.00 || || 1000.00 \n").to_stdout
      end

    end

    context 'with a deposit of 1000 and withdrawal of 500' do

      it 'will print a statement containing the statement' do
        subject.instance_variable_set(:@transactions, [Transaction.new(1000, 0, 1000, '19/09/2016'), Transaction.new(0, 500, 500, '20/09/2016')])
        expect{ subject.print_statment() }.to output("date || credit || debit || balance\n20/09/2016 || || 500.00 || 500.00 \n19/09/2016 || 1000.00 || || 1000.00 \n").to_stdout
      end

    end

  end

end
