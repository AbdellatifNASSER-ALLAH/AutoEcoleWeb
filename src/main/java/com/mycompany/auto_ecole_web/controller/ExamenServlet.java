package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.ExamenDao;
import com.mycompany.auto_ecole_web.model.Examen;

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
import java.sql.Date;

@WebServlet("/examen")
public class ExamenServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String idParam = request.getParameter("id");
        String dateExamen = request.getParameter("dateExamen");
        String heureExamen = request.getParameter("heureExamen");
        String vehiculeId = request.getParameter("vehiculeId");
        String instructeurId = request.getParameter("instructeurId");

        // Créer un nouvel objet Examen avec les données reçues
        Examen examen;
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            examen = new Examen(id, Date.valueOf(dateExamen), heureExamen, Integer.parseInt(vehiculeId), Integer.parseInt(instructeurId));
        } else {
            examen = new Examen(Date.valueOf(dateExamen), heureExamen, Integer.parseInt(vehiculeId), Integer.parseInt(instructeurId));
        }

        // Enregistrer ou mettre à jour l'examen dans la base de données
        try {
            ExamenDao examenDao = new ExamenDao();
            if (idParam != null && !idParam.isEmpty()) {
                examenDao.update(examen);
            } else {
                examenDao.save(examen);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamenServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement de l'examen", ex);
            throw new ServletException("Erreur lors de l'enregistrement de l'examen", ex);
        }

        // Rediriger vers la page affichant la liste des examens
        response.sendRedirect(request.getContextPath() + "/examen");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                ExamenDao examenDao = new ExamenDao();
                examenDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/examen");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(ExamenServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression de l'examen", ex);
                throw new ServletException("Erreur lors de la suppression de l'examen", ex);
            }
        }

        Examen edtExamen = null;
        String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                ExamenDao examenDao = new ExamenDao();
                edtExamen = examenDao.getById(id);
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(ExamenServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de l'examen", ex);
                throw new ServletException("Erreur lors de la récupération de l'examen", ex);
            }
        }

        try {
            ExamenDao examenDao = new ExamenDao();
            List<Examen> listeExamens = examenDao.getAll();
            request.setAttribute("listeExamens", listeExamens);
            request.setAttribute("edtExamen", edtExamen);
        } catch (SQLException ex) {
            Logger.getLogger(ExamenServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des examens", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des examens", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/examen.jsp");
        dispatcher.forward(request, response);
    }
}
