package c;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.metier.GestionClientsLocal;

/**
 * Servlet implementation class Acceuil_client
 */
@WebServlet("/Acceuil_client")
public class Acceuil_client extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	GestionClientsLocal metierClient;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Acceuil_client() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recupere la session
		HttpSession session = request.getSession(true); 
		//faire une redirection vers la page acceuil client ...
		//if(session.getAttribute("user")!=null) {
			//int id =(int) session.getAttribute("user");
		// envoyer la liste des client
		request.setAttribute("comptes", metierClient.listeCompte(3));
		this.getServletContext().getRequestDispatcher("/acceuil_client.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
