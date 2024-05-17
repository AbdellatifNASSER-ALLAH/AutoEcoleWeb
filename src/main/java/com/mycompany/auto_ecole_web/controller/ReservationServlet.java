package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.ReservationDao;
import com.mycompany.auto_ecole_web.model.Reservation;

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

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String idParam = request.getParameter("id");
        String eleveId = request.getParameter("eleveId");
        String coursId = request.getParameter("coursId");
        String dateReservation = request.getParameter("dateReservation");
        String heureReservation = request.getParameter("heureReservation");

        // Créer un nouvel objet Reservation avec les données reçues
        Reservation reservation;
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            reservation = new Reservation(id, Integer.parseInt(eleveId), Integer.parseInt(coursId), Date.valueOf(dateReservation), heureReservation);
        } else {
            reservation = new Reservation(Integer.parseInt(eleveId), Integer.parseInt(coursId), Date.valueOf(dateReservation), heureReservation);
        }

        // Enregistrer ou mettre à jour la réservation dans la base de données
        try {
            ReservationDao reservationDao = new ReservationDao();
            if (idParam != null && !idParam.isEmpty()) {
                reservationDao.update(reservation);
            } else {
                reservationDao.save(reservation);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationServlet.class.getName()).log(Level.SEVERE, "Erreur lors de l'enregistrement de la réservation", ex);
            throw new ServletException("Erreur lors de l'enregistrement de la réservation", ex);
        }

        // Rediriger vers la page affichant la liste des réservations
        response.sendRedirect(request.getContextPath() + "/reservation");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idDel = request.getParameter("id_del");
        if (idDel != null && !idDel.isEmpty()) {
            try {
                int id = Integer.parseInt(idDel);
                ReservationDao reservationDao = new ReservationDao();
                reservationDao.delete(id);
                response.sendRedirect(request.getContextPath() + "/reservation");
                return;
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(ReservationServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la suppression de la réservation", ex);
                throw new ServletException("Erreur lors de la suppression de la réservation", ex);
            }
        }

        Reservation edtReservation = null;
        String idEdt = request.getParameter("id_edt");
        if (idEdt != null && !idEdt.isEmpty()) {
            try {
                int id = Integer.parseInt(idEdt);
                ReservationDao reservationDao = new ReservationDao();
                edtReservation = reservationDao.getById(id);
            } catch (NumberFormatException | SQLException ex) {
                Logger.getLogger(ReservationServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la réservation", ex);
                throw new ServletException("Erreur lors de la récupération de la réservation", ex);
            }
        }

        try {
            ReservationDao reservationDao = new ReservationDao();
            List<Reservation> listeReservations = reservationDao.getAll();
            request.setAttribute("listeReservations", listeReservations);
            request.setAttribute("edtReservation", edtReservation);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationServlet.class.getName()).log(Level.SEVERE, "Erreur lors de la récupération de la liste des réservations", ex);
            throw new ServletException("Erreur lors de la récupération de la liste des réservations", ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/reservation.jsp");
        dispatcher.forward(request, response);
    }
}
