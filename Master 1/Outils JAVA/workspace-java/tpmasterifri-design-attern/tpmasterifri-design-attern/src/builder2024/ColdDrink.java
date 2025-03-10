package builder2024;

public class ColdDrink implements Item {

	@Override
	public String name() {
		return "Cold drink";
	}

	@Override
	public Float price() {
		return 1000f;
	}

	@Override
	public Packing packing() {
		return new Bottle();
	}

}
