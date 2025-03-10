public class CompteBancaire {

    public int numero;
    public double solde;

    public CompteBancaire(int numero, double solde) {
        this.numero = numero;
        this.solde = solde;
    }

    public void deposerArgent(double depot) {
        Journalization deposer = Journalization.getInstance();
        if (depot >= 0) {
            deposer.log("Dépot de " + depot + "sur le compte " + this.numero);
            solde += depot;
        }
    }

    public void retirerArgent(double retrait) {
        Journalization retirer = Journalization.getInstance();
        if (retrait <= this.solde) {
            retirer.log("Retrait de " + retrait + " du compte " + this.numero);
            solde -= retrait;
        }
    }

}
