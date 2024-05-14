package com.mycompany.auto_ecole_web.auth;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login page
        request.getRequestDispatcher("jsp/auth/LoginJsp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validate username and password (you can check against your database)
        boolean isValidUser = validateUser(username, password);
        
        if (isValidUser) {
            // Redirect to the dashboard page upon successful login
            response.sendRedirect("index.jsp");
        } else {
            // Redirect back to the login page with an error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    // Dummy method for user validation (replace with your actual validation logic)
    private boolean validateUser(String username, String password) {
        // Dummy validation logic - Always return true for demo
        return true;
    }
}
