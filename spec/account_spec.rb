require 'account'

describe Account do

  describe '#initialize' do
    context 'when a new account is made' do
      it 'has a balance of 0' do
        expect(subject.current_balance).to eq 0
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

end
