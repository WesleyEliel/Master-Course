package builder2024;

public class Burger implements Item {

	@Override
	public String name() {
		return "Burger";
	}

	@Override
	public Float price() {
		return 5000f;
	}

	@Override
	public Packing packing() {
		return new Wrapper();
	}

}
