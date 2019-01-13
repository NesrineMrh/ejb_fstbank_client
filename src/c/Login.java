package c;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Banquier;
import com.entity.Client;
import com.metier.GestionClientsLocal;
import com.metier.GestionComptesLocal;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private GestionClientsLocal metier;

	public Login() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mail = request.getParameter("username");
		String mdp = request.getParameter("password");
		Client client = metier.check(mail, mdp);
		
		if (client != null) {
			request.getSession().setAttribute("ClientId", client.getId());
			request.getSession().setAttribute("Nom", client.getNom());
			request.getSession().setAttribute("Prenom", client.getPrenom());
			request.getSession().setAttribute("Login", client.getLogin());
			response.sendRedirect("./Acceuil_client");
			} else {
			Banquier banquier = metier.checkBnaquier(mail, mdp);
			System.out.println(mail + mdp + banquier);

			if (banquier != null) {
				

				request.getSession().setAttribute("banquierId", banquier.getId());
				response.sendRedirect("./GestionComptes");
			}
			else {
				// pour dire que mail ou mdp incorrect
				request.setAttribute("err", true);
				this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}

	}

}