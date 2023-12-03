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

}
