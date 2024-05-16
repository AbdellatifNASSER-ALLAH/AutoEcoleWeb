package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.CandidatDao;
import com.mycompany.auto_ecole_web.dao.MoniteurDao;
import com.mycompany.auto_ecole_web.model.Candidat;
import com.mycompany.auto_ecole_web.model.Moniteur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/modifierCandidat")
public class CandidatEdit extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'identifiant du moniteur à modifier depuis les paramètres de requête
        int id = Integer.parseInt(request.getParameter("id"));

        // Récupérer le moniteur correspondant depuis la base de données
        CandidatDao candidatDao = null;
        try {
            candidatDao = new CandidatDao();
        } catch (SQLException ex) {
            Logger.getLogger(CandidatEdit.class.getName()).log(Level.SEVERE, null, ex);
        }
        Candidat cand = null;
        try {
            cand = candidatDao.getUserById(id);
        } catch (SQLException ex) {
            Logger.getLogger(CandidatEdit.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Stocker le moniteur dans l'attribut de requête pour l'afficher dans le formulaire de modification
        request.setAttribute("candidat", cand);

        // Rediriger vers la page de modification du moniteur
        request.getRequestDispatcher("jsp/candidat.jsp").forward(request, response);
    }
}
