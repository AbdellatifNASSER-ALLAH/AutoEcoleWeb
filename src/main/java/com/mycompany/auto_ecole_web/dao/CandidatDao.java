package com.mycompany.auto_ecole_web.dao;

import java.sql.*;
import java.util.*;

import com.mycompany.auto_ecole_web.model.Candidat;

public class CandidatDao {
    private final Connection connection;

    public CandidatDao() throws SQLException {
        this.connection = DatabaseConnector.connect();
    }

    public int count() {
        int nbr = 0;
        String query = "SELECT count(*) as count FROM Eleve"; // Utilisation de l'alias "count" pour obtenir le résultat
        try (PreparedStatement statement = connection.prepareStatement(query);
                ResultSet res = statement.executeQuery()) {
            if (res.next()) {
                nbr = res.getInt("count"); // Récupération du résultat à partir de l'alias "count"
            }
        } catch (SQLException ex) {
            // Gérer l'exception (affichage d'un message d'erreur, journalisation, etc.)
            ex.printStackTrace();
        }
        return nbr; // Retourne le nombre de moniteurs
    }

    // Method to find a user by username
    public Candidat findById(int userId) throws SQLException {
        String query = "SELECT * FROM Eleve WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    int id = res.getByte("id");
                    String nom = res.getString("nom");
                    String prenom = res.getString("prenom");
                    String adresse = res.getString("adresse");
                    String telephone = res.getString("telephone");
                    return new Candidat(id, nom, prenom, adresse, telephone);
                }
            }
        }
        return null; // User not found
    }

    // Method to find a user by username
    public Candidat findByName(String name) throws SQLException {
        String query = "SELECT * FROM Eleve WHERE nom = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, name);
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    int id = res.getByte("id");
                    String nom = res.getString("nom");
                    String prenom = res.getString("prenom");
                    String adresse = res.getString("adresse");
                    String telephone = res.getString("telephone");
                    return new Candidat(id, nom, prenom, adresse, telephone);
                }
            }
        }
        return null; // User not found
    
    }
    
public boolean isSigned(String name, String password) {
    String query = "SELECT * FROM Eleve WHERE nom = ? AND password = ?";
    try ( // Assuming you have a method to get connection
         PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setString(1, name);
        statement.setString(2, password);
        try (ResultSet res = statement.executeQuery()) {
            return res.next(); // If there's a match, return true; else false.
        }
    } catch (SQLException e) {
        // Handle any SQL exceptions that occur during execution
        e.printStackTrace(); // Replace this with appropriate error handling
    }
    return false; // Return false if an exception occurred
}



    // Method to save a new user
    public int save(Candidat user) throws SQLException {
        String query = "INSERT INTO Eleve (id, nom, prenom, adresse, telephone) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, user.getId());
            statement.setString(2, user.getNom());
            statement.setString(3, user.getPrenom());
            statement.setString(4, user.getAdresse());
            statement.setString(5, user.getTelephone());

            return statement.executeUpdate();
        }
    }

    // Method to update an existing user
    public void update(Candidat user) throws SQLException {
        String query = "UPDATE Eleve SET nom = ?, prenom = ?, adresse = ?, telephone = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getNom());
            statement.setString(2, user.getPrenom());
            statement.setString(3, user.getAdresse());
            statement.setString(4, user.getTelephone());
            statement.setInt(5, user.getId());

            statement.executeUpdate();
        }
    }

    // Method to delete a user by ID
    public void delete(int userId) throws SQLException {
        String query = "DELETE FROM Eleve WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }

    public int getNombreUser() {
        int nbr = 0;
        String query = "SELECT count(*) as count FROM Eleve"; // Utilisation de l'alias "count" pour obtenir le résultat
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

}
