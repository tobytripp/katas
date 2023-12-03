package net.tripp.sieve;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SieveOfEratosthenes {

	public List<Integer> sieve(int max) {
		boolean[] isPrime = new boolean[max + 1];
		List<Integer> primes = new ArrayList<Integer>();
		Arrays.fill(isPrime, true);
		
		for (int i = 2; i * i <= max; i++) {
			if (isPrime[i] ) {
				for (int j = i*i; j <= max; j += i) {
					isPrime[j] = false;
				}
			}
		}
		
		for (int i = 2; i <= max; i++) {
			if (isPrime[i]) {
				primes.add(i);
			}
		}
		
		return primes;
	}
}
