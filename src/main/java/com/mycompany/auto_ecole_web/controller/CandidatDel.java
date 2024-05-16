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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/deleteCandidat")
public class CandidatDel extends HttpServlet {

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
        
        try {
            candidatDao.delete(id);
        } catch (SQLException ex) {
            Logger.getLogger(CandidatEdit.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Stocker le moniteur dans l'attribut de requête pour l'afficher dans le formulaire de modification
        List<Candidat> listeCandidats = null;
        try {
            listeCandidats = candidatDao.getAll();
        } catch (SQLException ex) {
            Logger.getLogger(CandidatDel.class.getName()).log(Level.SEVERE, null, ex);
        }
            
          request.setAttribute("listeCandidats", listeCandidats); 
          

        // Rediriger vers la page de modification du moniteur
        request.getRequestDispatcher("jsp/candidat.jsp").forward(request, response);
    }
}
