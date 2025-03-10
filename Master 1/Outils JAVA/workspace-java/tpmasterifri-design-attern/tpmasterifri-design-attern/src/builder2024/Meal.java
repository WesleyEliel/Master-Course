package builder2024;

import java.util.ArrayList;
import java.util.List;

public class Meal {

	private List<Item> items;

	public Meal() {
		items = new ArrayList<Item>();
	}

	public void addItem(Item item) {
		items.add(item);
	}

	public float getCost() {
		float totalCost = 0f;
		for (Item item : items) {
			totalCost += item.price();
			totalCost += item.packing().price();
		}

		return totalCost;
	}

	public void showItems() {

		System.out.println("---Début de la facture -----");
		for (Item item : items) {
			System.out.println("Article : " + item.name() + " ; prix : " + item.price() + ", emballage : "
					+ item.packing().name());
		}
		System.out.println("---Fin de la facture -----");

	}

}
