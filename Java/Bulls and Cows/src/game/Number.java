package game;

import java.util.Arrays;
import java.util.Random;

public class Number {
	private int[] digits;

	public Number(int digitCount) {
		this(generateRandomDigits(digitCount));
	}

	public Number(int[] digits) {
		this.digits = digits;
	}

	private static int[] generateRandomDigits(int digitCount) {
		int[] generatedDigits = new int[digitCount];

		Random rand = new Random();
		int indx = 0;

		while (indx != digitCount) {
			int genDigit = rand.nextInt(10);

			boolean alreadyExist = false;
			for (int existingDigit : generatedDigits) {
				if (genDigit == existingDigit) {
					alreadyExist = true;
					break;
				}
			}

			if (!alreadyExist) {
				generatedDigits[indx] = genDigit;
				indx++;
			}
		}

		return generatedDigits;
	}

	@Override
	public boolean equals(Object obj) {

		// instanceof check is the object null or instance of some class

		if (!(obj instanceof Number)) {
			return false;
		}

		Number otherNumber = (Number) obj;

		return Arrays.equals(digits, otherNumber.digits);
	}

	public int[] getDigits() {
		return Arrays.copyOf(digits, digits.length);
	}

}
