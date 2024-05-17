package com.mycompany.auto_ecole_web.controller.user;
import com.mycompany.auto_ecole_web.dao.CandidatDao;
import com.mycompany.auto_ecole_web.model.Candidat;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/inscription")
public class Inscription extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        // Créer un nouvel objet Candidat avec les données reçues
        Candidat candidat = new Candidat(nom, prenom, adresse, telephone);

        // Enregistrer le candidat dans la base de données
        try {
            CandidatDao candidatDao = new CandidatDao();
            candidatDao.save(candidat);
        } catch (SQLException ex) {
            Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement du candidat", ex);
            throw new ServletException("Erreur lors de l'enregistrement du candidat", ex);
        }

        // Rediriger vers la page affichant la liste des candidats
               RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/client/Home.jsp");
        dispatcher.forward(request, response);
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                CandidatDao candidatDao = new CandidatDao();
                candidatDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/candidat");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du candidat", ex);
                throw new ServletException("Erreur lors de la suppression du candidat", ex);
            }
        }
        Candidat cnd = null;
         String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                CandidatDao candidatDao = new CandidatDao();
                cnd=candidatDao.getUserById(id);
              
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du candidat", ex);
                throw new ServletException("Erreur lors de la suppression du candidat", ex);
            }
        }
        
        
         String idEdt1 = request.getParameter("id_edt1");
        if (idEdt != null && !idEdt.isEmpty()) {
            
            
             String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

   
            try {
                int id = Integer.parseInt(idEdt1);
                 // Créer un nouvel objet Candidat avec les données reçues
        Candidat candidat = new Candidat(id,nom, prenom, adresse, telephone);
                CandidatDao candidatDao = new CandidatDao();
                candidatDao.update(candidat);
              
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du candidat", ex);
                throw new ServletException("Erreur lors de la suppression du candidat", ex);
            }
        }

        try {
            CandidatDao candidatDao = new CandidatDao();
            List<Candidat> listeCandidats = candidatDao.getAll();
            request.setAttribute("listeCandidats", listeCandidats);
            request.setAttribute("edtCandidat", cnd);

        } catch (SQLException ex) {
            Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des candidats", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des candidats", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/client/inscription.jsp");
        dispatcher.forward(request, response);
    }
}
