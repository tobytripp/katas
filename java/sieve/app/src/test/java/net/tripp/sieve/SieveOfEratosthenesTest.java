package net.tripp.sieve;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

public class SieveOfEratosthenesTest {
	private final SieveOfEratosthenes sieve = new SieveOfEratosthenes();
	
	@Test
	public void firstPrime() {
		List<Integer> primes = sieve.sieve(2);
		assertEquals(2, primes.get(0).intValue());
	}

	@Test
	public void nextPrime() {
		List<Integer> primes = sieve.sieve(3);
		assertEquals(3, primes.get(1).intValue());
	}
	
	@Test
	public void upToTen() {
		List<Integer> primes = sieve.sieve(10);
		Integer[] expected = new Integer[] {2, 3, 5, 7};
		assertArrayEquals(expected, primes.toArray());
	}
	
	@Test
	public void upToOneHundred() {
		List<Integer> primes = sieve.sieve(100);
		Integer[] expected = new Integer[] {
					2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
					31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
					73, 79, 83, 89, 97
				};
		assertArrayEquals(expected, primes.toArray());
	}
}
