package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.FactureDao;
import com.mycompany.auto_ecole_web.model.Facture;

import java.io.IOException;
import java.sql.Date;
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

@WebServlet("/facture")
public class FactureServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String idParam = request.getParameter("id");
        String eleveId = request.getParameter("eleveId");
        String montant = request.getParameter("montant");
        String datePaiement = request.getParameter("datePaiement");
        String modePaiement = request.getParameter("modePaiement");

        // Créer un nouvel objet Facture avec les données reçues
        Facture facture;
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            facture = new Facture(id, Integer.parseInt(eleveId), Double.parseDouble(montant), Date.valueOf(datePaiement), modePaiement);
        } else {
            facture = new Facture(Integer.parseInt(eleveId), Double.parseDouble(montant), Date.valueOf(datePaiement), modePaiement);
        }

        // Enregistrer ou mettre à jour la facture dans la base de données
        try {
            FactureDao factureDao = new FactureDao();
            if (idParam != null && !idParam.isEmpty()) {
                factureDao.update(facture);
            } else {
                factureDao.save(facture);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FactureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement de la facture", ex);
            throw new ServletException("Erreur lors de l'enregistrement de la facture", ex);
        }

        // Rediriger vers la page affichant la liste des factures
        response.sendRedirect(request.getContextPath() + "/facture");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                FactureDao factureDao = new FactureDao();
                factureDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/facture");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(FactureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression de la facture", ex);
                throw new ServletException("Erreur lors de la suppression de la facture", ex);
            }
        }

        Facture edtFacture = null;
        String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                FactureDao factureDao = new FactureDao();
                edtFacture = factureDao.getById(id);
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(FactureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la facture", ex);
                throw new ServletException("Erreur lors de la récupération de la facture", ex);
            }
        }

        try {
            FactureDao factureDao = new FactureDao();
            List<Facture> listeFactures = factureDao.getAll();
            request.setAttribute("listeFactures", listeFactures);
            request.setAttribute("edtFacture", edtFacture);
        } catch (SQLException ex) {
            Logger.getLogger(FactureServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des factures", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des factures", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/facture.jsp");
        dispatcher.forward(request, response);
    }
}
