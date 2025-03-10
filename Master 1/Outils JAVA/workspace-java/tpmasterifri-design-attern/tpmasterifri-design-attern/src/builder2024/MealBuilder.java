package builder2024;

public class MealBuilder {

	public Meal prepareVegetalMeal() {

		Meal vegMeal = new Meal();
		vegMeal.addItem(new VegetalBurger());
		vegMeal.addItem(new Pepsi());

		return vegMeal;

	}

	public Meal prepareChickenMeal() {
		Meal chickenMeal = new Meal();
		chickenMeal.addItem(new ChickenBurger());
		chickenMeal.addItem(new Coke());

		return chickenMeal;

	}

}
