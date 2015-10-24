require 'prime'

describe 'Third task' do
  
  describe RationalSequence do
    
    it 'can calculate the first rational number' do
      expect(RationalSequence.new(1).to_a).to eq ['1/1'.to_r]
    end

    it 'can calculate the 4th rational number' do
      expect(RationalSequence.new(4).to_a).to eq  %w(1/1 2/1 1/2 1/3).map(&:to_r)
    end

    it 'can calculate the 14th rational number' do
      expect(RationalSequence.new(14).to_a).to eq  %w(1/1 2/1 1/2 1/3 3/1 4/1 3/2 2/3 1/4 1/5 5/1 6/1 5/2 4/3).map(&:to_r)
    end

    it 'can calculate the 24th rational number' do
      expect(RationalSequence.new(24).to_a).to eq  %w(1/1 2/1 1/2 1/3 3/1 4/1 3/2 2/3 1/4 1/5 5/1 6/1 5/2 4/3 3/4 2/5 1/6 1/7 3/5 5/3 7/1 8/1 7/2 5/4 ).map(&:to_r)
    end

    it 'works fine with 0' do
      expect(RationalSequence.new(0).to_a).to eq  []
    end

  end

  describe FibonacciSequence do
    
    it 'can calculate the first Fibonacci number' do
      expect(FibonacciSequence.new(1).to_a).to eq [1]
    end

    it 'can calculate the first Fibonacci number with one keyword param' do
      expect(FibonacciSequence.new(1, first: 0).to_a).to eq [0]
    end

    it 'can calculate the 5th Fibonacci number' do
      expect(FibonacciSequence.new(5).to_a).to eq [1, 1, 2, 3, 5]
    end

    it 'can calculate the 5th Fibonacci number with one keyword param' do
      expect(FibonacciSequence.new(5, first: 0).to_a).to eq [0, 1, 1, 2, 3]
    end

    it 'can calculate the 5th Fibonacci number with two keyword params' do
      expect(FibonacciSequence.new(5, first: 0, second: 1).to_a).to eq [0, 1, 1, 2, 3]
    end
  end

  describe PrimeSequence do
    
    it 'can calculate the first prime (and it is not Optimus)' do
      expect(PrimeSequence.new(1).to_a).to eq Prime.first(1)
    end

    it 'can calculate the 5th prime' do
      expect(PrimeSequence.new(5).to_a).to eq Prime.first(5)
    end

    it 'can calculate 100th prime' do
      expect(PrimeSequence.new(100).to_a).to eq Prime.first(100)
    end
  end

  describe DrunkenMathematician do
    
    it 'is drunk' do
      expect(->_{_%_}["->_{_%%_}[%p]"]).to eq '->_{_%_}["->_{_%%_}[%p]"]'
    end

    describe '#meaningless' do
      it 'can calculate for 1' do
        expect(DrunkenMathematician.meaningless(1)).to eq Rational(1, 1)
      end
      it 'can calculate for 6' do
        expect(DrunkenMathematician.meaningless(6)).to eq Rational(1, 4)
      end
    end

    describe '#aimless' do
      it 'can calculate for 2' do
        expect(DrunkenMathematician.aimless(2)).to eq '2/3'.to_r
      end
    end

    describe '#worthless' do
      it 'can calculate for 1' do
        expect(DrunkenMathematician.worthless(1)).to eq %w(1/1).map(&:to_r)
      end

      it 'can calculate for 5' do
        expect(DrunkenMathematician.worthless(5)).to eq %W(1/1 2/1 1/2 1/3).map(&:to_r)
      end
    end
  end
end