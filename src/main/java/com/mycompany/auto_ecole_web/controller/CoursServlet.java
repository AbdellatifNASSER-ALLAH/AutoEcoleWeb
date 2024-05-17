package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.CoursDao;
import com.mycompany.auto_ecole_web.model.Cours;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/cours")
public class CoursServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String titre = request.getParameter("titre");
        String dateDebutStr = request.getParameter("date_debut");
        String dateFinStr = request.getParameter("date_fin");
        String heureDebut = request.getParameter("heure_debut");
        String heureFin = request.getParameter("heure_fin");
        int vehiculeId = Integer.parseInt(request.getParameter("vehicule_id"));

        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebut = new Date(formatter.parse(dateDebutStr).getTime());
            Date dateFin = new Date(formatter.parse(dateFinStr).getTime());

            CoursDao coursDao = new CoursDao();
            Cours cours = new Cours(titre, dateDebut, dateFin, heureDebut, heureFin, vehiculeId);

            if (id != null && !id.isEmpty()) {
                cours.setId(Integer.parseInt(id));
                coursDao.update(cours);
            } else {
                coursDao.save(cours);
            }

            response.sendRedirect(request.getContextPath() + "/cours");
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(CoursServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement du cours", ex);
            throw new ServletException("Erreur lors de l'enregistrement du cours", ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                CoursDao coursDao = new CoursDao();
                coursDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/cours");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(CoursServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression du cours", ex);
                throw new ServletException("Erreur lors de la suppression du cours", ex);
            }
        }

        Cours crs = null;
        String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                CoursDao coursDao = new CoursDao();
                crs = coursDao.getById(id);
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(CoursServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération du cours", ex);
                throw new ServletException("Erreur lors de la récupération du cours", ex);
            }
        }

        String idEdt1 = request.getParameter("id_edt1");
        if (idEdt1 != null && !idEdt1.isEmpty()) {
            String titre = request.getParameter("titre");
            String dateDebutStr = request.getParameter("date_debut");
            String dateFinStr = request.getParameter("date_fin");
            String heureDebut = request.getParameter("heure_debut");
            String heureFin = request.getParameter("heure_fin");
            int vehiculeId = Integer.parseInt(request.getParameter("vehicule_id"));

            try {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date dateDebut = new Date(formatter.parse(dateDebutStr).getTime());
                Date dateFin = new Date(formatter.parse(dateFinStr).getTime());
                int id = Integer.parseInt(idEdt1);
                Cours cours = new Cours(id, titre, dateDebut, dateFin, heureDebut, heureFin, vehiculeId);
                CoursDao coursDao = new CoursDao();
                coursDao.update(cours);
            } catch (NumberFormatException | SQLException | ParseException ex) {
                Logger.getLogger(CoursServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la mise à jour du cours", ex);
                throw new ServletException("Erreur lors de la mise à jour du cours", ex);
            }
        }

        try {
            CoursDao coursDao = new CoursDao();
            List<Cours> listeCours = coursDao.getAll();
            request.setAttribute("listeCours", listeCours);
            request.setAttribute("edtCours", crs);
        } catch (SQLException ex) {
            Logger.getLogger(CoursServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des cours", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des cours", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/cours.jsp");
        dispatcher.forward(request, response);
    }
}
