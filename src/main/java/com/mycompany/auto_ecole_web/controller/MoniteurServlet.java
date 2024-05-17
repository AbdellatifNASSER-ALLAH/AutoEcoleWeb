package com.mycompany.auto_ecole_web.controller;
import com.mycompany.auto_ecole_web.dao.CandidatDao;
import com.mycompany.auto_ecole_web.dao.MoniteurDao;
import com.mycompany.auto_ecole_web.model.Candidat;
import com.mycompany.auto_ecole_web.model.Moniteur;

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

@WebServlet("/moniteur")
public class MoniteurServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        // Créer un nouvel objet Candidat avec les données reçues
         Moniteur moniteur = new  Moniteur(nom, prenom, adresse, telephone);
          String idEdt1 = request.getParameter("id_edt1");
        // Enregistrer le candidat dans la base de données
        try {
            if (idEdt1 != null && !idEdt1.isEmpty()) {
            int id = Integer.parseInt(idEdt1);
                 // Créer un nouvel objet Candidat avec les données reçues
               moniteur = new Moniteur(id,nom, prenom, adresse, telephone);
                MoniteurDao moniteurDao = new MoniteurDao();
               moniteurDao.update(moniteur);
              
            }else{
                MoniteurDao  moniteurDao = new  MoniteurDao();
             moniteurDao.save(moniteur); 
            }
           
        } catch (SQLException ex) {
            Logger.getLogger( MoniteurServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement du candidat", ex);
            throw new ServletException("Erreur lors de l'enregistrement du candidat", ex);
        }

        // Rediriger vers la page affichant la liste des candidats
        response.sendRedirect(request.getContextPath() + "/moniteur");
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                 MoniteurDao  moniteurDao = new  MoniteurDao();
                 moniteurDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/moniteur");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger( MoniteurServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du  Moniteur", ex);
                throw new ServletException("Erreur lors de la suppression du  Moniteur", ex);
            }
        }
         Moniteur cnd = null;
         String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                 MoniteurDao  moniteurDao = new  MoniteurDao();
                cnd= moniteurDao.getById(id);
                
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger( MoniteurServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du  Moniteur", ex);
                throw new ServletException("Erreur lors de la suppression du  Moniteur", ex);
            }
        }
        


        try {
             MoniteurDao  moniteurDao = new  MoniteurDao();
            List< Moniteur> listeMoniteurs =  moniteurDao.getAll();
            request.setAttribute("listeMoniteurs", listeMoniteurs);
            request.setAttribute("edtMoniteur", cnd);

        } catch (SQLException ex) {
            Logger.getLogger( MoniteurServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des candidats", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des candidats", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/moniteur.jsp");
        dispatcher.forward(request, response);
    }
}
