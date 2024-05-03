package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Models.Commandes;
import Models.MagasinStructure;
import Models.MonthStructure;
import Models.WeekStructure;

public class DataCommande {

	Connection connection1;

	public DataCommande() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_bimo", "root", "");
		} catch (Exception e) {
			System.out.println("erreur de connexion");
		}

	}
	public int NbrMagasin() {
		String sql = "SELECT count(*) as 'nbr' FROM `magasin`;";
		int Total=0 ;
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Total = rs.getInt("nbr");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Total;
	}
	public int NbrVente() {
		String sql = "SELECT count(*) as 'nbrVente' FROM `commandes`";
		int Total=0 ;
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Total = rs.getInt("nbrVente");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Total;
	}
	public int NbrClient() {
		String sql = "SELECT COUNT( DISTINCT id_client) as Client  FROM `commandes`";
		int Total=0 ;
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Total = rs.getInt("Client");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Total;
	}
	
	public ArrayList<Commandes> afficher() {
		ArrayList<Commandes> List = null;
		String sql = "SELECT commandes.Date 'DateCmd', commandes.Quantite 'Quantite', commandes.Montant 'Montant', CLIENT.Nom 'client', magasin.Nom 'Magasin', stocks.id_Stock 'Stock' FROM `commandes` join CLIENT on commandes.id_Client = CLIENT.id_Clt join stocks on commandes.id_Stock = stocks.id_Stock join magasin on stocks.id_Magasin = magasin.id_Mag ORDER by commandes.Date desc";
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			List = new ArrayList<Commandes>();
			while (rs.next()) {
				Commandes cmd = new Commandes();
				// Affecter des resultat
				cmd.setDate(rs.getDate("DateCmd"));
				cmd.setQuantite(rs.getLong("Quantite"));
				cmd.setMontant(rs.getDouble("Montant"));
				cmd.setClient(rs.getString("client"));
				cmd.setMagasin(rs.getString("Magasin"));
				cmd.setStock(rs.getString("Stock"));

				List.add(cmd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return List;

	}

	public ArrayList<WeekStructure> getStatictiqueSemaine() {
		ArrayList<WeekStructure> List = null;
		String sql = "SELECT week(commandes.Date) 'Week_Number',Sum(commandes.Montant) 'Montant' FROM `commandes` join CLIENT on commandes.id_Client = CLIENT.id_Clt join stocks on commandes.id_Stock = stocks.id_Stock join magasin on stocks.id_Magasin = magasin.id_Mag group by week(commandes.Date) ORDER by week(commandes.Date)";
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			List = new ArrayList<WeekStructure>();
			while (rs.next()) {
				WeekStructure data = new WeekStructure();
				// Affecter des resultat
				data.setNumWeek(rs.getLong("Week_Number"));
				data.setMontant(rs.getDouble("Montant"));
				List.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return List;

	}

	public ArrayList<MonthStructure> getStatictiqueMois() {
		ArrayList<MonthStructure> List = null;
		String sql = "SELECT Month(commandes.Date) 'Month_Number',Sum(commandes.Montant) 'Montant' FROM `commandes` join CLIENT on commandes.id_Client = CLIENT.id_Clt join stocks on commandes.id_Stock = stocks.id_Stock join magasin on stocks.id_Magasin = magasin.id_Mag group by week(commandes.Date) ORDER by Month(commandes.Date) ;";
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			List = new ArrayList<MonthStructure>();
			while (rs.next()) {
				MonthStructure data = new MonthStructure();
				// Affecter des resultat
				data.setNumMonth(rs.getLong("Month_Number"));
				data.setMontant(rs.getDouble("Montant"));
				List.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return List;

	}

	public ArrayList<MagasinStructure> getStatictiqueMagasin() {
		ArrayList<MagasinStructure> List = null;
		String sql = "SELECT magasin.Nom 'Magasin', COUNT(commandes.id_cmd) 'Nbr_vente' FROM `commandes` join CLIENT on commandes.id_Client = CLIENT.id_Clt join stocks on commandes.id_Stock = stocks.id_Stock join magasin on stocks.id_Magasin = magasin.id_Mag GROUP by magasin.Nom;";
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			List = new ArrayList<MagasinStructure>();
			while (rs.next()) {
				MagasinStructure data = new MagasinStructure();
				// Affecter des resultat
				data.setMagasin_Name(rs.getString("Magasin"));
				data.setNombre_Vente(rs.getLong("Nbr_vente"));
				List.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return List;

	}

	public Double getMontantTotal() {
		String sql = "SELECT max(Montant) as 'Montant_Total' FROM `commandes`";
		Double Total = 0.0;
		java.sql.Statement statement;
		try {
			statement = connection1.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Total = rs.getDouble("Montant_Total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Total;
	}
}
