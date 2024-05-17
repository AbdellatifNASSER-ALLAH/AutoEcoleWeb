package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.VoitureDao;
import com.mycompany.auto_ecole_web.model.Voiture;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/vehicule")
public class VoitureServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String idParam = request.getParameter("id");
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");
        String anneeFabrication = request.getParameter("anneeFabrication");

        // Créer un nouvel objet Voiture avec les données reçues
        Voiture voiture;
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            voiture = new Voiture(id, marque, modele, Integer.parseInt(anneeFabrication));
        } else {
            voiture = new Voiture(marque, modele, Integer.parseInt(anneeFabrication));
        }

        // Enregistrer ou mettre à jour la voiture dans la base de données
        try {
            VoitureDao voitureDao = new VoitureDao();
            if (idParam != null && !idParam.isEmpty()) {
                voitureDao.update(voiture);
            } else {
                voitureDao.save(voiture);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoitureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement de la voiture", ex);
            throw new ServletException("Erreur lors de l'enregistrement de la voiture", ex);
        }

        // Rediriger vers la page affichant la liste des voitures
        response.sendRedirect(request.getContextPath() + "/voiture");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                VoitureDao voitureDao = new VoitureDao();
                voitureDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/voiture");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(VoitureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression de la voiture", ex);
                throw new ServletException("Erreur lors de la suppression de la voiture", ex);
            }
        }

        Voiture edtVoiture = null;
        String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                VoitureDao voitureDao = new VoitureDao();
                edtVoiture = voitureDao.getById(id);
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(VoitureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la voiture", ex);
                throw new ServletException("Erreur lors de la récupération de la voiture", ex);
            }
        }

        try {
            VoitureDao voitureDao = new VoitureDao();
            List<Voiture> listeVoitures = voitureDao.getAll();
            request.setAttribute("listeVoitures", listeVoitures);
            request.setAttribute("edtVoiture", edtVoiture);
        } catch (SQLException ex) {
            Logger.getLogger(VoitureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des voitures", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des voitures", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/vehicule.jsp");
        dispatcher.forward(request, response);
    }
}
