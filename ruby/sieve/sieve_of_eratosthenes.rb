require "test/unit"

class SieveOfEratosthenes
  def sieve(max)
    primes = [nil, nil, *2..max]
    (2..Math.sqrt(max)).each do |i|
      next unless primes[i]
      (i**2..max).step(i) { |j| primes[j] = nil }
    end

    primes.compact
  end
end

class SieveOfEratosthenesTest < Test::Unit::TestCase
  def test_first_prime
    sieve = SieveOfEratosthenes.new
    assert_equal [2], sieve.sieve(2)
  end

  def test_second_prime
    sieve = SieveOfEratosthenes.new
    assert_equal [2,3], sieve.sieve(3)
  end

  def test_up_to_ten
    sieve = SieveOfEratosthenes.new
    assert_equal [2, 3, 5, 7], sieve.sieve(10)
  end

  def test_up_to_one_hundred
    sieve = SieveOfEratosthenes.new
    assert_equal [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
      31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
      73, 79, 83, 89, 97
    ], sieve.sieve(100)
  end
end
