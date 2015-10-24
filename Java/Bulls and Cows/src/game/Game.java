package game;

import java.util.Scanner;

public class Game {

	public static void main(String[] args) {
		final int DIGIT_COUNT = 8;

		Number generatedNumber = new Number(DIGIT_COUNT);

		boolean success = false;

		// TODO move the validation logic in NumberMatcher class
		// or in other class

		// TODO computer vs computer or computer vs human

		Scanner inputScanner = new Scanner(System.in);

		while (!success) {
			System.out.println("Enter your guess:");

			String userInput = inputScanner.nextLine();

			if (userInput == null || userInput.length() != DIGIT_COUNT) {
				System.out.println("Wrong input!");
				continue;
			}

			boolean correctInput = true;
			for (int i = 0; i < userInput.length(); ++i) {
				if (!Character.isDigit(userInput.charAt(i))) {
					correctInput = false;
					break;
				}
			}

			if (!correctInput) {
				System.out.println("Wrong input!");
				continue;
			}

			int[] userDigits = new int[DIGIT_COUNT];
			for (int i = 0; i < userInput.length(); i++) {
				userDigits[i] = Integer.parseInt(userInput.substring(i, i + 1));
			}

			Number guess = new Number(userDigits);

			if (generatedNumber.equals(guess)) {
				success = true;
			} else {
				Answer ans = NumberMatcher.match(generatedNumber, guess);
				System.out.println(ans);
			}
		}

		inputScanner.close();

		System.out.println("Success!");
	}

}
