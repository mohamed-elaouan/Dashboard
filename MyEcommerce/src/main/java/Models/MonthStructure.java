package Models;

public class MonthStructure {
	private Long NumMonth;
	private Double Montant;

	public MonthStructure() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MonthStructure(Long numMonth, Double montant) {
		super();
		NumMonth = numMonth;
		Montant = montant;
	}

	public Long getNumMonth() {
		return NumMonth;
	}

	public void setNumMonth(Long numMonth) {
		NumMonth = numMonth;
	}

	public Double getMontant() {
		return Montant;
	}

	public void setMontant(Double montant) {
		Montant = montant;
	}
}
