class Integer
  def is_prime?
    return false if self < 2
    2.upto(pred).all? { |divisor| remainder(divisor).nonzero? }
  end
end

class RationalSequence
  include Enumerable

  def initialize(limit)
    @limit = limit
    @arr = []
  end

  def get_next_rational(i, j = 1)
    while j < i
      if i % 2 == 0 and not @arr.include?(Rational(j, i - j))
        @arr << Rational(j, i - j)
        return Rational(j, i - j)
      elsif i % 2 != 0 and not @arr.include?(Rational(i - j, j))
        @arr << Rational(i - j, j)
        return Rational(i - j, j)
      end
      j += 1
    end
  end

  def each
    i, counter = 2, 0
    while counter < @limit
      if get_next_rational(i) != nil
        yield @arr[counter]
        counter += 1
      else
        i += 1
      end
    end
  end
end

class PrimeSequence
  include Enumerable

  def initialize(limit)
    @limit = limit
  end

  def each
    counter = 0
    number = 2
    while counter < @limit
      if number.is_prime?
        yield number
        counter += 1
        number += 1
      else
        number += 1
      end
    end
  end
end

class FibonacciSequence
  include Enumerable

  def initialize(limit, first: 1, second: 1)
    @limit = limit
    @first = first
    @second = second
  end

  def each
    current, subsequent = @first, @second
    counter = 0
    while counter < @limit
      yield current
      current, subsequent = subsequent, current + subsequent
      counter += 1
    end
  end
end

module DrunkenMathematician
  module_function
  include Enumerable

  def is_odd?(number)
    number % 2 != 0
  end

  def meaningless(n)
    sequence = RationalSequence.new(n).to_a
    group_one = sequence.select { |i| i.numerator.is_prime? or i.denominator.is_prime? }
    group_two = sequence - group_one

    first = group_one.inject { |z, x| z * x }
    second = group_two.inject { |z, x| z * x }

    (first == nil ? 1 : first) / (second == nil ? 1 : second)
  end

  def aimless(n)
    sequence = PrimeSequence.new(n).to_a
    if is_odd?(n)
      sequence << 1
    end
    rational_numbers = []
    sequence.each_slice(2).to_a.each do |a|
      rational_numbers << Rational(a[0], a[1])
    end
    sum_rational_numbers = rational_numbers.inject { |sum, x| sum + x }
    sum_rational_numbers == nil ? 0 : sum_rational_numbers
  end

  def worthless(n)
    n_fibonacci = FibonacciSequence.new(n).to_a.last.to_r
    sequence = RationalSequence.new(Float::INFINITY).lazy
    sum = 0

    sequence.take_while do |rational|
      sum += rational
      sum <= n_fibonacci
    end.force
  end
end
