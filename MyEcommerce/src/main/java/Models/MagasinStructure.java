package Models;

public class MagasinStructure {
	private String Magasin_Name;
	private long Nombre_Vente;

	public MagasinStructure(String magasin_Name, long nombre_Vente) {
		super();
		Magasin_Name = magasin_Name;
		Nombre_Vente = nombre_Vente;
	}

	public MagasinStructure() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMagasin_Name() {
		return Magasin_Name;
	}

	public void setMagasin_Name(String magasin_Name) {
		Magasin_Name = magasin_Name;
	}

	public long getNombre_Vente() {
		return Nombre_Vente;
	}

	public void setNombre_Vente(long nombre_Vente) {
		Nombre_Vente = nombre_Vente;
	}
}
