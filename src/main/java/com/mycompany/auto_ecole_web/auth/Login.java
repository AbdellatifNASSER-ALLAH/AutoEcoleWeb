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
        System.out.println(username);      
        System.out.println(password);

        
        // Validate username and password (you can check against your database)
        boolean isValidUser=true;
        try {
            isValidUser = validateUser(username, password);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (isValidUser) {
            // Redirect to the dashboard page upon successful login
            response.sendRedirect("jsp/accueil.jsp");
        } else {
            // Redirect back to the login page with an error message
            request.setAttribute("errorMessage", "Invalid username or password"+"useer : "+username+"pass : "+password+ isValidUser);
            request.getRequestDispatcher("jsp/auth/LoginJsp.jsp").forward(request, response);
        }
    }
    
    // Dummy method for user validation (replace with your actual validation logic)
    private boolean validateUser(String username, String password) throws SQLException {
        CandidatDao cnd=new CandidatDao();
        if(cnd.isSigned(username, password)){
            return true;
        }
        return false;
    }
}
