/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.auto_ecole_web.dao;

import com.mycompany.auto_ecole_web.model.Cours;
import com.mycompany.auto_ecole_web.model.Moniteur;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class CoursDao {
 private Connection connection;

    public CoursDao() throws SQLException {
        this.connection = DatabaseConnector.connect();
    }

    public Cours find(int id) throws SQLException {
        String query = "SELECT * FROM cours WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    String titre = res.getString("titre");
                    Date dateDebut = res.getDate("date_debut");
                    Date dateFin = res.getDate("date_fin");
                    String heureDebut = res.getString("heure_debut");
                    String heureFin = res.getString("heure_fin");
                    int vehiculeId = res.getInt("vehicule_id");
                    return new Cours(id, titre, dateDebut, dateFin, heureDebut, heureFin, vehiculeId);
                }
            }
        }
        return null;
    }

    // Méthode pour récupérer tous les cours
    public List<Cours> getAll() throws SQLException {
        List<Cours> coursList = new ArrayList<>();
        String query = "SELECT * FROM Cours";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet res = statement.executeQuery()) {
            while (res.next()) {
                int id = res.getInt("id");
                String titre = res.getString("titre");
                Date dateDebut = res.getDate("date_debut");
                Date dateFin = res.getDate("date_fin");
                String heureDebut = res.getString("heure_debut");
                String heureFin = res.getString("heure_fin");
                int vehiculeId = res.getInt("vehicule_id");

                coursList.add(new Cours(id, titre, dateDebut, dateFin, heureDebut, heureFin, vehiculeId));
            }
        }
        return coursList;
    }

    // Méthode pour enregistrer un nouveau cours
    public void save(Cours cours) throws SQLException {
        String query = "INSERT INTO Cours (titre, date_debut, date_fin, heure_debut, heure_fin, vehicule_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, cours.getTitre());
            statement.setDate(2, (Date) cours.getDateDebut());
            statement.setDate(3, (Date) cours.getDateFin());
            statement.setString(4, cours.getHeureDebut());
            statement.setString(5, cours.getHeureFin());
            statement.setInt(6, cours.getVehiculeId());
            statement.executeUpdate();
        }
    }

    // Méthode pour mettre à jour un cours existant
    public void update(Cours cours) throws SQLException {
        String query = "UPDATE Cours SET titre = ?, date_debut = ?, date_fin = ?, heure_debut = ?, heure_fin = ?, vehicule_id = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setString(1, cours.getTitre());
            st.setDate(2, (Date) cours.getDateDebut());
            st.setDate(3, (Date) cours.getDateFin());
            st.setString(4, cours.getHeureDebut());
            st.setString(5, cours.getHeureFin());
            st.setInt(6, cours.getVehiculeId());
            st.setInt(7, cours.getId());
            st.executeUpdate();
        }
    }
    
        public Cours getById(int id) throws SQLException {
        Cours cours = null;
        String query = "SELECT * FROM Cours WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Construire l'objet Moniteur à partir des données récupérées
     
                    cours = new Cours();
                    cours.setId(resultSet.getInt("id"));
                    cours.setTitre(resultSet.getString("titre"));
                    cours.setDateDebut(resultSet.getDate("date_debut"));
                    cours.setDateFin(resultSet.getDate("date_fin"));      
                    cours.setHeureFin(resultSet.getString("heure_fin"));
                    cours.setHeureDebut(resultSet.getString("heure_debut"));
                    cours.setVehiculeId(resultSet.getInt("vehicule_id"));

                    
                }
            }
        }
        return cours;
    }

    // Méthode pour supprimer un cours par ID
    public void delete(int coursId) throws SQLException {
        String query = "DELETE FROM Cours WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, coursId);
            statement.executeUpdate();
        }
    }

    public int getNombreCours() {
        int nbr = 0;
        String query = "SELECT count(*) as count FROM Cours"; // Utilisation de l'alias "count" pour obtenir le résultat
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet res = statement.executeQuery()) {
            if (res.next()) {
                nbr = res.getInt("count"); // Récupération du résultat à partir de l'alias "count"
            }
        } catch (SQLException ex) {
            // Gérer l'exception (affichage d'un message d'erreur, journalisation, etc.)
            ex.printStackTrace();
        }
        return nbr;
    }
    
    // Méthode pour récupérer un cours par son ID
    public Cours getCoursById(int coursId) throws SQLException {
        String query = "SELECT * FROM cours WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, coursId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String titre = resultSet.getString("titre");
                    Date dateDebut = resultSet.getDate("date_debut");
                    Date dateFin = resultSet.getDate("date_fin");
                    String heureDebut = resultSet.getString("heure_debut");
                    String heureFin = resultSet.getString("heure_fin");
                    int vehiculeId = resultSet.getInt("vehicule_id");
                    return new Cours(id, titre, dateDebut, dateFin, heureDebut, heureFin, vehiculeId); // Retourner un objet Cours avec les détails récupérés
                }
            }
        }
        return null; // Retourner null si aucun cours n'est trouvé avec cet ID
    }   
}
