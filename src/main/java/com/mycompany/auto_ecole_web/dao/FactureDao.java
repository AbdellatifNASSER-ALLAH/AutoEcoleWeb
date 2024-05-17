/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.auto_ecole_web.dao;

import com.mycompany.auto_ecole_web.model.Facture;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author HP
 */
public class FactureDao {
     private Connection connection;

    public FactureDao() throws SQLException {
        this.connection = DatabaseConnector.connect();
    }

    // Méthode pour récupérer tous les paiements
    public List<Facture> getAll() throws SQLException {
        List<Facture> paiements = new ArrayList<>();
        String query = "SELECT * FROM FacturePaiement";
        try (PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int eleveId = resultSet.getInt("eleve_id");
                double montant = resultSet.getDouble("montant");
                Date datePaiement = resultSet.getDate("date_paiement");
                String modePaiement = resultSet.getString("mode_paiement");

                Facture paiement = new Facture(eleveId, montant, datePaiement, modePaiement);
                paiements.add(paiement);
            }
        }
        return paiements;
    }

    public Facture getById(int factureId) throws SQLException {
    String query = "SELECT * FROM facturepaiement WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, factureId);
        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                int eleveId = resultSet.getInt("eleve_id");
                double montant = resultSet.getDouble("montant");
                java.util.Date datePaiement = resultSet.getDate("date_paiement");
                String modePaiement = resultSet.getString("mode_paiement");
                return new Facture(id, eleveId, montant, datePaiement, modePaiement); // Retourner un objet Facture avec les détails récupérés
            }
        }
    }
    return null; // Retourner null si aucune facture n'est trouvée avec cet ID
}
    
    public void update(Facture facture) throws SQLException {
    String query = "UPDATE FacturePaiement SET eleve_id = ?, montant = ?, date_paiement = ?, mode_paiement = ? WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, facture.getEleveId());
        statement.setDouble(2, facture.getMontant());
        statement.setDate(3, (java.sql.Date) facture.getDatePaiement());
        statement.setString(4, facture.getModePaiement());
        statement.setInt(5, facture.getId());
        statement.executeUpdate();
    }
}


    // Méthode pour enregistrer un nouveau paiement
    public void save(Facture paiement) throws SQLException {
        String query = "INSERT INTO FacturePaiement (eleve_id,montant, date_paiement, mode_paiement) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, paiement.getEleveId());
            statement.setDouble(2, paiement.getMontant());
            statement.setDate(3, new java.sql.Date(paiement.getDatePaiement().getTime()));
            statement.setString(4, paiement.getModePaiement());
            statement.executeUpdate();
        }
    }

    // Méthode pour supprimer un paiement par ID
    public void delete(int paiementId) throws SQLException {
        String query = "DELETE FROM FacturePaiement WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, paiementId);
            statement.executeUpdate();
        }
    }
    
    public double totalRevenues() {
       double nbr = 0;
        String query = "SELECT sum(montant) as count FROM FacturePaiement"; // Utilisation de l'alias "count" pour obtenir le résultat
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet res = statement.executeQuery()) {
            if (res.next()) {
                nbr = res.getDouble( "count"); // Récupération du résultat à partir de l'alias "count"
            }
        } catch (SQLException ex) {
            // Gérer l'exception (affichage d'un message d'erreur, journalisation, etc.)
            ex.printStackTrace();
        }
        return nbr;
    }
}
