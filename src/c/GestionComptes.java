package c;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Client;
import com.entity.Compte;
import com.metier.GestionClientsLocal;
import com.metier.GestionComptesLocal;
import com.sun.jmx.snmp.Timestamp;


@WebServlet("/GestionComptes")
public class GestionComptes extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	GestionComptesLocal metier ;
	@EJB
	GestionClientsLocal metierClient;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("mod") == null){
			metierClient.ajouterClient(new Client());
			this.getServletContext().getRequestDispatcher("/ajouter_compte.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/modifier_compte.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	  if(request.getParameter("modifier") == null) {
		int solde =Integer.parseInt(request.getParameter("solde"));
		metier.ajouterCompte(new Compte(solde,null,1,metierClient.listClient()));
		metier.ajouterCompte(new Compte(solde+1000,null,2,metierClient.listClient()));
	  }else {
		  	int code =Integer.parseInt(request.getParameter("code"));
			int solde =Integer.parseInt(request.getParameter("solde"));
			Compte c = new Compte();
			c =	metier.rechercherCompteParId(code);
			c.setSolde(solde);
			metier.modifierCompte(c);
	  }
		request.setAttribute("comptes",metier.consulterComptes());
		this.getServletContext().getRequestDispatcher("/liste_compte.jsp").forward(request, response);

	}

}
