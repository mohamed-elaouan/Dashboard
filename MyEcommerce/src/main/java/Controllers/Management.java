package Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import DAO.DataCommande;
import Models.Commandes;
import Models.MonthStructure;
import Models.WeekStructure;

@WebServlet("/homePage")
public class Management extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Management() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DataCommande dao = new DataCommande();
		// get Le Montant Total
		Double Montant = dao.getMontantTotal();
		// get data Semaine
		ArrayList<WeekStructure> Semaine = new ArrayList();
		Semaine = dao.getStatictiqueSemaine();
		// get Data Mois
		ArrayList<MonthStructure> Mois = new ArrayList();
		Mois = dao.getStatictiqueMois();
		// get Data Commandes
		ArrayList<Commandes> Commande = new ArrayList();
		Commande = dao.afficher();
		//
		int nbrVente = dao.NbrVente();
		int nbrClient = dao.NbrClient();
		int nbrMagasin = dao.NbrMagasin();
		// Envoyer
		request.setAttribute("MoisData", Mois);
		request.setAttribute("MontantTotal", Montant);
		request.setAttribute("SemaineData", Semaine);
		request.setAttribute("list", Commande);
		request.setAttribute("nbrVente", nbrVente);
		request.setAttribute("nbrClient", nbrClient);
		request.setAttribute("nbrMagasin", nbrMagasin);
		//
		RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
