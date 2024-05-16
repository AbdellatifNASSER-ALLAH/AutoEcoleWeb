package com.mycompany.auto_ecole_web.auth;

import com.mycompany.auto_ecole_web.dao.UserDao;
import com.mycompany.auto_ecole_web.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/register")
public class Register extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the registration page
        request.getRequestDispatcher("jsp/auth/Register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        String repeatedPassword = request.getParameter("rpassword");
        
        // Check if passwords match
        if (password.equals(repeatedPassword)){
            // Create a new user object
            User user = new User(username, password, "candidat");
            
            // Save the user using UserDao
            UserDao userDao = null;
            try {
                userDao = new UserDao();
            } catch (SQLException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                userDao.save(user);
                // Redirect to login page after successful registration
                response.sendRedirect("login");
                return; // Exit the method after redirection
            } catch (SQLException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // If passwords don't match, set error message and forward back to registration page
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("jsp/auth/Register.jsp").forward(request, response);
            return; // Exit the method after forwarding
        }
        
        // If an error occurred, set error message and forward back to registration page
        request.setAttribute("errorMessage", "Sorry, an error occurred. Please try again.");
        request.getRequestDispatcher("jsp/auth/Register.jsp").forward(request, response);
    }
}
