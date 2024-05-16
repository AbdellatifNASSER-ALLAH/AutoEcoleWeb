package com.mycompany.auto_ecole_web.auth;

import com.mycompany.auto_ecole_web.dao.CandidatDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/login")
public class Login extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login page
        request.getRequestDispatcher("jsp/auth/LoginJsp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validate username and password
        String userType = "null";
        try {
            userType = validateUser(username, password);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (userType.equals("admin") || userType.equals("candidat")) {
            // Add user information to session
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("userType", userType);

            // Redirect to the appropriate page based on user type
            if (userType.equals("admin")) {
                response.sendRedirect("jsp/accueil.jsp");
            } else if (userType.equals("candidat")) {
                response.sendRedirect("jsp/client/Home.jsp");
            }
        } else {
            // Redirect back to the login page with an error message
            request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
            request.getRequestDispatcher("jsp/auth/LoginJsp.jsp").forward(request, response);
        }
    }
    
    // Method to validate user credentials
    private String validateUser(String username, String password) throws SQLException {
        CandidatDao cnd = new CandidatDao();
        String userType = cnd.isSigned(username, password);
        if (userType.equals("admin")) {
            return "admin";
        } else if (userType.equals("candidat")) {
            return "candidat";
        } else {
            return "null";
        }
    }
}
