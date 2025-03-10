package builder2024;

public class BorneDeCommande {

	public static void main(String[] args) {

		MealBuilder builder = new MealBuilder();

		Meal ChickenMeal = builder.prepareChickenMeal();
		ChickenMeal.showItems();
		System.out.println("Montant Menu chiecken : " + ChickenMeal.getCost());

		Meal VegetalMeal = builder.prepareVegetalMeal();
		VegetalMeal.showItems();
		System.out.println("Montant Menu végetal : " + VegetalMeal.getCost());

	}

}
