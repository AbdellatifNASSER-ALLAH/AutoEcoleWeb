package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.SeanceDao;
import com.mycompany.auto_ecole_web.model.Seance;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/seance")
public class SeanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        String idEdt = request.getParameter("id_edt");

        try {
            SeanceDao seanceDao = new SeanceDao();

            if (idDel != null && !idDel.isEmpty()) {
                int id = Integer.parseInt(idDel);
                seanceDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/seance");
                return;
            } else if (idEdt != null && !idEdt.isEmpty()) {
                int id = Integer.parseInt(idEdt);
                Seance edtSeance = seanceDao.getById(id);
                request.setAttribute("edtSeance", edtSeance);
            }

            List<Seance> listeSeances = seanceDao.getAll();
            request.setAttribute("listeSeances", listeSeances);

        } catch (SQLException ex) {
            Logger.getLogger(SeanceServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération des données", ex);
            throw new ServletException("Erreur lors de la récupération des données", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/seance.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int coursId = Integer.parseInt(request.getParameter("coursId"));
        String dateSeance = request.getParameter("dateSeance");
        String heureDebut = request.getParameter("heureDebut");
        String heureFin = request.getParameter("heureFin");

        try {
            SeanceDao seanceDao = new SeanceDao();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = formatter.parse(dateSeance);
        Date dateS = new Date(parsedDate.getTime());

            Seance seance = new Seance(coursId, dateS, heureDebut, heureFin);

            if (id != null && !id.isEmpty()) {
                seance.setId(Integer.parseInt(id));
                seanceDao.update(seance);
            } else {
                seanceDao.save(seance);
            }

            response.sendRedirect(request.getContextPath() + "/seance");
        } catch (SQLException ex) {
            Logger.getLogger(SeanceServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement de la séance", ex);
            throw new ServletException("Erreur lors de l'enregistrement de la séance", ex);
        } catch (ParseException ex) {
            Logger.getLogger(SeanceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
