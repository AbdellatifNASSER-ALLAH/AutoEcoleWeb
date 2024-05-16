package com.mycompany.auto_ecole_web.controller;

import com.mycompany.auto_ecole_web.dao.CandidatDao;
import com.mycompany.auto_ecole_web.dao.CoursDao;
import com.mycompany.auto_ecole_web.dao.ExamenDao;
import com.mycompany.auto_ecole_web.dao.FactureDao;
import com.mycompany.auto_ecole_web.dao.MoniteurDao;
import com.mycompany.auto_ecole_web.dao.ReservationDao;
import com.mycompany.auto_ecole_web.dao.SeanceDao;
import com.mycompany.auto_ecole_web.dao.VoitureDao;
import com.mycompany.auto_ecole_web.model.Cours;
import com.mycompany.auto_ecole_web.model.Examen;
import com.mycompany.auto_ecole_web.model.Facture;
import com.mycompany.auto_ecole_web.model.Reservation;
import com.mycompany.auto_ecole_web.model.Seance;
import com.mycompany.auto_ecole_web.model.Voiture;
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
import javax.swing.JLabel;

@WebServlet("/statistique")
public class StatistiquesServlet extends HttpServlet {
    
      private  FactureDao paiementDao;
  private CandidatDao userDao;
    private CoursDao coursDao;
    private ExamenDao examenDao;
    private VoitureDao vehiculeDao;
    private MoniteurDao moniteurDao;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
          try { 
              userDao=new CandidatDao();
              coursDao=new CoursDao();
            examenDao=new ExamenDao();
            paiementDao=new FactureDao();
            vehiculeDao=new VoitureDao();
            moniteurDao=new MoniteurDao();
          } catch (SQLException ex) {
              Logger.getLogger(StatistiquesServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
            
            int nbrUsers=userDao.calculCandidats();
            int nbrMoniteurs=moniteurDao.calculMoniteurs();
            int nbrVehicules=vehiculeDao.getNombreVehicule();
            int nbrCours=coursDao.getNombreCours();
            int nbrExamen = 0;
          try {
              nbrExamen=examenDao.calculExamens();
          } catch (SQLException ex) {
              Logger.getLogger(StatistiquesServlet.class.getName()).log(Level.SEVERE, null, ex);
          }
            double totalRevenues=paiementDao.totalRevenues();
            
            
        request.setAttribute("nbrUsers", nbrUsers);
        request.setAttribute("nbrMoniteurs", nbrMoniteurs);
        request.setAttribute("nbrVehicules", nbrVehicules);
        request.setAttribute("nbrCours", nbrCours);
        request.setAttribute("nbrExamen", nbrExamen);
        request.setAttribute("totalRevenues", totalRevenues);


        request.getRequestDispatcher("jsp/statistique.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Le code de validation des informations de connexion pourrait être ajouté ici si nécessaire
        // Redirection en fonction du type d'utilisateur
        response.sendRedirect("jsp/accueil.jsp");
    }
}
