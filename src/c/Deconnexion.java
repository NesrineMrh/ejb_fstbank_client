package c;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Deconnexion")
public class Deconnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Deconnexion() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recupere la session
		HttpSession session = request.getSession(true); 
		//Détruire la session 
		session.invalidate();
		//faire une redirection vers la page login ...
		this.getServletContext().getRequestDispatcher("/Login").forward(request, response);
	}

}