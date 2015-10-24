package game;

public class Answer {
	private int bulls;
	private int cows;

	public Answer(int bulls, int cows) {
		this.bulls = bulls;
		this.cows = cows;
	}

	public int getBulls() {
		return bulls;
	}

	public int getCows() {
		return cows;
	}

	@Override
	public String toString() {
		return "Bulls: " + bulls + ", Cows: " + cows;
	}

}
