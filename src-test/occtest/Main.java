package occtest;

public class Main {
	public static void main(String... args) {
		try {
			System.out.println("Made it through!");
		} catch (Throwable x) {
			x.printStackTrace();
		}
	}
}
