package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Client;
import com.entity.Compte;
import com.entity.CompteProfessionnel;
import com.entity.FactoryCompte;
import com.metier.GestionClientsLocal;
import com.metier.GestionComptesLocal;

@WebServlet("/GestionComptes")
public class GestionComptes extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	GestionComptesLocal metier;
	@EJB
	GestionClientsLocal metierClient;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// rediriger vers la page de modification (ajax).
		if (request.getParameter("modifier") != null) {
			int id = Integer.parseInt(request.getParameter("modifier"));
			Compte compte = metier.rechercherCompteParId(id);
			request.setAttribute("compte", compte);
			this.getServletContext().getRequestDispatcher("/modifier_compte.jsp").forward(request, response);

		} // traitement de la suppression
		else if (request.getParameter("supprimer") != null) {
			int id = Integer.parseInt(request.getParameter("supprimer"));
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			if (metier.supprimerCompte(id))
				out.print("true");
			else
				out.print("false");

		}//traitement du virement
		else if (request.getParameter("verser") != null) {
			int id = Integer.parseInt(request.getParameter("verser"));
			System.out.println(id);
			Compte compte = metier.rechercherCompteParId(id);
			request.setAttribute("compte", compte);
			this.getServletContext().getRequestDispatcher("/virement.jsp").forward(request, response);

		}
		else if (request.getParameter("retirer") != null) {
			int id = Integer.parseInt(request.getParameter("retirer"));
			System.out.println(id);
			Compte compte = metier.rechercherCompteParId(id);
			request.setAttribute("compte", compte);
			this.getServletContext().getRequestDispatcher("/retrait.jsp").forward(request, response);

		}else if(request.getParameter("associer") != null) {
			request.setAttribute("comptes", metier.consulterComptes());
			request.setAttribute("clients", metierClient.listClient());
			/*ArrayList<Client> clients = new ArrayList<>();
			clients = (ArrayList<Client>) metierClient.listClientByCompte(2);
			
			clients.forEach(System.out::println);*/
			this.getServletContext().getRequestDispatcher("/compte_client.jsp").forward(request, response);
		
		} else {

			// envoyer la liste des compte
			request.setAttribute("comptes", metier.consulterComptes());
			this.getServletContext().getRequestDispatcher("/compte.jsp").forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// teste si la requete Post est pour modifier
		if (request.getParameter("modifiercompte") != null) {

			int code = Integer.parseInt(request.getParameter("code"));
			/*
			 * DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH); try {
			 * Date date =format.parse(request.getParameter("date")) ; } catch
			 * (ParseException e) { // TODO Auto-generated catch block e.printStackTrace();
			 * }
			 */
			double solde = Double.parseDouble(request.getParameter("solde"));
			String type = request.getParameter("type");
			Compte c = new Compte();
			c = metier.rechercherCompteParId(code);
			c.setSolde(solde);
			c.setType(type);
			metier.modifierCompte(c);

		}else if(request.getParameter("associer") != null) {
			String[] compte = request.getParameterValues("compte");
			String client = request.getParameter("client");
			for (int i = 0 ; i < compte.length ; i++) System.out.println(compte[i]);
			System.out.println("----------------------cc"+client);
		
		
		}else if(request.getParameter("verser") != null) {
			int codeDestine = Integer.parseInt(request.getParameter("codeDestine"));
			double montant =Double.parseDouble(request.getParameter("montant"));
			int code = Integer.parseInt(request.getParameter("code"));
			System.out.println("code2"+codeDestine+"-----mont"+montant+"-------code"+code);
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			if (metier.rechercherCompteParId(codeDestine)!=null){
			    Compte c = metier.rechercherCompteParId(code);
			    System.out.println("dkhhhhhhhhhhhhhhhhel!!");
			    if(montant>c.getSolde()){
			    	System.out.println("sodeeeeeInnn");
					out.print("soldeInsuffisant");	
			    }else {
			    	System.out.println("ccccccccc bnnnn");
				metier.verser(montant, codeDestine);
				metier.retirer(montant, code);
				out.print("./GestionComptes");
			    }
			}else {
		    	System.out.println("ComppppppppteIntrr");
				out.print("CompteNonTrouvee");
			}
		}else if(request.getParameter("retirer") != null){
			double solde = Double.parseDouble(request.getParameter("solde"));
			double montant =Double.parseDouble(request.getParameter("montant"));
			int code = Integer.parseInt(request.getParameter("code"));
				metier.retirer(montant, code);
			}
		
		// teste si la requete Post est pour ajouter
		else {
			String type = request.getParameter("type");
			double solde = 0;
			if (!request.getParameter("solde").equals("")) {
				solde = Integer.parseInt(request.getParameter("solde"));
			}
			String typeCompte=request.getParameter("typeCompte");
			
			FactoryCompte fc = new FactoryCompte();
			Compte compte = fc.getCompte(typeCompte);
			Date dateCreation = new Date();
			compte.setClient(new ArrayList<Client>());
			compte.setSolde(solde);
			compte.setDateCreation(dateCreation);
			
			//le cas d'un compte professionnel il faut ajouter les champ supplaimentaire.
			if(typeCompte.equals("Professionnel")) {
				
				((CompteProfessionnel) compte).setType("Professionnel");
				}else {
				compte.setType(type);
				}
			metier.ajouterCompte(compte);
			
		}
		/*
		 * request.setAttribute("comptes", metier.consulterComptes());
		 * this.getServletContext().getRequestDispatcher("/compte.jsp").forward(request,
		 * response);
		 */
		response.sendRedirect("./GestionComptes");
	}

}
