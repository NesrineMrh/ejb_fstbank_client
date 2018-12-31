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
import com.entity.Compte;
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
			
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			List<Compte> comptes = new ArrayList<>();
			comptes.add(metier.rechercherCompteParId(2));
			//Client c = new Client(nom,prenom);
			
			metierClient.ajouterClient(new Client(nom,prenom,comptes));
		}
		response.sendRedirect("./GestionClients");
	}

}
