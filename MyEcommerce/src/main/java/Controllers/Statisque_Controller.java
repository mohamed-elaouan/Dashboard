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
import Models.MagasinStructure;
import Models.MonthStructure;
import Models.WeekStructure;

/**
 * Servlet implementation class Statisque_Controller
 */

@WebServlet("/Statistique")
public class Statisque_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Statisque_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DataCommande dao = new DataCommande();
		// get Statistique Magasin
		ArrayList<MagasinStructure> Magasin = new ArrayList<MagasinStructure>();
		Magasin = dao.getStatictiqueMagasin();
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
		// Envoyer
		request.setAttribute("MoisData", Mois);
		request.setAttribute("Magasin", Magasin);
		request.setAttribute("MontantTotal", Montant);
		request.setAttribute("SemaineData", Semaine);
		request.setAttribute("list", Commande);
		RequestDispatcher disp = request.getRequestDispatcher("charts.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
