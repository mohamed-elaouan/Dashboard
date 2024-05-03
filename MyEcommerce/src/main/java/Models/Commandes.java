package Models;

import java.sql.Date;

public class Commandes {
	private Long id_Cmd;
	private Date Date;
	private String Stock;
	private String Client;
	private String Magasin;
	private Long Quantite;
	private Double Montant;

	public Commandes(java.sql.Date date, String stock, String client, String magasin, Long quantite, Double montant) {
		// this.id_Cmd = id_Cmd;
		this.Date = date;
		this.Stock = stock;
		this.Client = client;
		this.Magasin = magasin;
		this.Quantite = quantite;
		this.Montant = montant;
	}

	public Commandes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId_Cmd() {
		return id_Cmd;
	}

	public void setId_Cmd(Long id_Cmd) {
		this.id_Cmd = id_Cmd;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public Long getQuantite() {
		return Quantite;
	}

	public void setQuantite(Long quantite) {
		Quantite = quantite;
	}

	public Double getMontant() {
		return Montant;
	}

	public void setMontant(Double montant) {
		Montant = montant;
	}

	public String getMagasin() {
		return Magasin;
	}

	public void setMagasin(String magasin) {
		Magasin = magasin;
	}

	public String getStock() {
		return Stock;
	}

	public void setStock(String stock) {
		Stock = stock;
	}

	public String getClient() {
		return Client;
	}

	public void setClient(String client) {
		Client = client;
	}

}
