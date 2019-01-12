package c;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Client;
import com.entity.ClientProfessionnel;
import com.entity.Compte;
import com.entity.CompteProfessionnel;
import com.entity.FactoryClient;
import com.entity.FactoryCompte;
import com.metier.GestionClientsLocal;
import com.metier.GestionComptesLocal;

@WebServlet("/GestionClients")
public class GestionClients extends HttpServlet {

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
			Client client = metierClient.afficherClient(id);
			request.setAttribute("client", client);
			this.getServletContext().getRequestDispatcher("/modifier_client.jsp").forward(request, response);

		}// traitement de la suppression
		else if (request.getParameter("supprimer") != null) {
			int id = Integer.parseInt(request.getParameter("supprimer"));
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			if (metierClient.supprimerClient(id))
				out.print("true");
			else
				out.print("false");

		} else {
			// envoyer la liste des client
			request.setAttribute("clients", metierClient.listClient());
			this.getServletContext().getRequestDispatcher("/client.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// teste si la requete Post est pour modifier
		if (request.getParameter("modifierclient") != null) {

			int id = Integer.parseInt(request.getParameter("id"));
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			Client c = new Client();
			c = metierClient.afficherClient(id);
			c.setId(id);
			c.setNom(nom);
			c.setPrenom(prenom);
			metierClient.modifierClient(c);

		}
		// teste si la requete Post est pour ajouter
		else {
			String typeClient=request.getParameter("typeClient");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse;
			String telephone ;
			//creation de l'objet grace a factory
			FactoryClient fc = new FactoryClient();
			Client client = fc.getClient(typeClient);
			client.setNom(nom);
			client.setPrenom(prenom);
			
			if(typeClient.equals("Professionnel")) {
				adresse = request.getParameter("adresseEnt");
				telephone = request.getParameter("telephoneEnt");
				((ClientProfessionnel) client).setAdresseEntreprise(adresse);
				((ClientProfessionnel) client).setTelephoneEntreprise(telephone);
				}
			
			metierClient.ajouterClient(client);
		}
		response.sendRedirect("./GestionClients");
	}

}
