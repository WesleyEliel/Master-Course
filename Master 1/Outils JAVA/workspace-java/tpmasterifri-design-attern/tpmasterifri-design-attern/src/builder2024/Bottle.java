package builder2024;

public class Bottle implements Packing {

	@Override
	public String name() {
		return "Bottle packing";
	}

	@Override
	public Float price() {
		return 0f;
	}

}
