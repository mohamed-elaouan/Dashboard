package Models;

public class WeekStructure {
	private Long NumWeek;
	private Double Montant;
	public WeekStructure() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WeekStructure(Long numWeek, Double montant) {
		super();
		NumWeek = numWeek;
		Montant = montant;
	}
	public Long getNumWeek() {
		return NumWeek;
	}
	public void setNumWeek(Long numWeek) {
		NumWeek = numWeek;
	}
	public Double getMontant() {
		return Montant;
	}
	public void setMontant(Double montant) {
		Montant = montant;
	}

}
