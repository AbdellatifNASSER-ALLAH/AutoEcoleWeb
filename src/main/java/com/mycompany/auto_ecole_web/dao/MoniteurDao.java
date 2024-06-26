/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.auto_ecole_web.dao;

import com.mycompany.auto_ecole_web.model.Moniteur;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class MoniteurDao {
     private Connection connection;

    public MoniteurDao() throws SQLException {
        this.connection  = DatabaseConnector.connect();
    }

    
    // Method to find a Moniteur by ID
public Moniteur findMoniteurById(int moniteurId) throws SQLException {
    String query = "SELECT * FROM Instructeur WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, moniteurId);
        try (ResultSet res = statement.executeQuery()) {
            if (res.next()) {
                int id = res.getInt("id");
                String nom = res.getString("nom");
                String prenom = res.getString("prenom");
                String adresse = res.getString("adresse");
                String telephone = res.getString("telephone");
                return new Moniteur(id, nom, prenom, adresse, telephone);
            }
        }
    }
    return null; // Moniteur not found
}


    
    // Method to delete a user by ID
public void delete(int moniteurId) throws SQLException {
    String query = "DELETE FROM Instructeur WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, moniteurId);
        statement.executeUpdate();
    }
}

// Méthode pour mettre à jour un cours existant
    public void update(Moniteur moniteur) throws SQLException {
        String query = "UPDATE Instructeur SET nom = ?, prenom = ?, adresse = ?, telephone = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setString(1, moniteur.getNom());
            st.setString(2, moniteur.getPrenom());
            st.setString(3, moniteur.getAdresse());
            st.setString(4, moniteur.getTelephone());
            st.setInt(5, moniteur.getId());
            st.executeUpdate();
        }
    }
    
    
    // Method to retrieve all Moniteurs
    public List<Moniteur> getAll() throws SQLException {
        List<Moniteur> MoniteurList = new ArrayList<>();
        String query = "SELECT * FROM Instructeur";
        try (PreparedStatement statement = connection.prepareStatement(query);
                ResultSet res = statement.executeQuery()) {
            while (res.next()) {
                int id = res.getByte("id");
                String nom = res.getString("nom");
                String prenom = res.getString("prenom");
                String adresse = res.getString("adresse");
                String telephone = res.getString("telephone");
                MoniteurList.add(new Moniteur(id,nom,prenom,adresse,telephone));
            }
        }
        return MoniteurList;
    }

    // Method to save a new Moniteur
    public void save(Moniteur Moniteur) throws SQLException {
    String query = "INSERT INTO Instructeur ( nom, prenom, adresse, telephone) VALUES ( ?, ?, ?, ?)";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
       
        statement.setString(1, Moniteur.getNom());
        statement.setString(2, Moniteur.getPrenom());
        statement.setString(3, Moniteur.getAdresse());
        statement.setString(4, Moniteur.getTelephone());

        statement.executeUpdate();
    }
}
    public int calculMoniteurs() {
    int nbr = 0;
    String query = "SELECT count(*) as count FROM Instructeur"; // Utilisation de l'alias "count" pour obtenir le résultat
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
    
   public void deleteById(int id) throws SQLException {
    // Préparez la requête SQL pour supprimer l'enregistrement avec l'ID spécifié
    String query = "DELETE FROM Instructeur WHERE id = ?";
    
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        // Remplacez le paramètre '?' par l'ID spécifié
        statement.setInt(1, id);
        
        // Exécutez la requête de suppression
        statement.executeUpdate();
    }
}


    // Méthode pour récupérer tous les ID des moniteurs depuis la base de données
    public List<String> getAllInstructorIds() throws SQLException {
        List<String> instructorIds = new ArrayList<>();
        String query = "SELECT id FROM moniteur";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    String instructorId = resultSet.getString("id");
                    instructorIds.add(instructorId);
                }
            }
        }

        return instructorIds;
    }

    // Méthode pour récupérer un moniteur par son ID
    public Moniteur getById(int id) throws SQLException {
        Moniteur moniteur = null;
        String query = "SELECT * FROM instructeur WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Construire l'objet Moniteur à partir des données récupérées
                    moniteur = new Moniteur();
                    moniteur.setId(resultSet.getInt("id"));
                    moniteur.setNom(resultSet.getString("nom"));
                    moniteur.setPrenom(resultSet.getString("prenom"));
                    moniteur.setAdresse(resultSet.getString("adresse"));
                    moniteur.setTelephone(resultSet.getString("telephone"));
                    
                }
            }
        }
        return moniteur;
    }
    
    
        public int getNombreInstructeur() {
        int nbr = 0;
        String query = "SELECT count(*) as count FROM Instructeur"; // Utilisation de l'alias "count" pour obtenir le résultat
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
