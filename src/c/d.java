package c;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Client;
import com.metier.GestionClientsLocal;


/**
 * Servlet implementation class d
 */
@WebServlet("/d")
public class d extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	@EJB
	GestionClientsLocal gclientLocal;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Client c = new Client("reda","nesrine");
		gclientLocal.ajouterClient(c);
		request.setAttribute("client", gclientLocal.listClient());

		this.getServletContext().getRequestDispatcher("/NewFile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
