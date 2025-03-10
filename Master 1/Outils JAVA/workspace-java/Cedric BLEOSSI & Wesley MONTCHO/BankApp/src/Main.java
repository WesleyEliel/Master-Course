public class Main {
    public static void main(String[] args) {

        CompteBancaire compte_1  = new CompteBancaire(1234, 2000);

        compte_1.deposerArgent(2000);
        compte_1.retirerArgent(4000);

    }
}