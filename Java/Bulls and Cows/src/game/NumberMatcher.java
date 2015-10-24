package game;

public class NumberMatcher {

	// TODO validate the user input from the Game class

	public static Answer match(Number original, Number guess) {
		int[] digits = original.getDigits();
		int[] guessedDigits = guess.getDigits();

		int bulls = 0;
		int cows = 0;

		for (int i = 0; i < digits.length; ++i) {
			for (int j = 0; j < guessedDigits.length; j++) {
				if (digits[i] == guessedDigits[j]) {
					cows++;
					break;
				}
			}

			if (digits[i] == guessedDigits[i]) {
				bulls++;
				cows--;
			}
		}

		return new Answer(bulls, cows);
	}

}
