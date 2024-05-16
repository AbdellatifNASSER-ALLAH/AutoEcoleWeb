package com.mycompany.auto_ecole_web.dao;

import java.sql.*;
import java.util.*;

import com.mycompany.auto_ecole_web.model.Candidat;
import com.mycompany.auto_ecole_web.model.User;

public class UserDao {
private Connection connection;

    public UserDao() throws SQLException {
        this.connection  = DatabaseConnector.connect();
    }
public int calculUsers() {
    int nbr = 0;
    String query = "SELECT count(*) as count FROM user"; // Utilisation de l'alias "count" pour obtenir le résultat
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
    public User find(int userId) throws SQLException {
        String query = "SELECT * FROM user WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                int id = res.getByte("id");
                String username = res.getString("username");
                String password = res.getString("password");
                String role = res.getString("role");
                
                return new User(id,username,password,role);
                }
            }
        }
        return null; // User not found
    }
    
    // Method to find a user by username
    public Candidat getUserByName(String name) throws SQLException {
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
                return new Candidat(id,nom,prenom,adresse,telephone);
                }
            }
        }
        return null; // User not found
    }
    
    // is Signed
  // Méthode pour vérifier si un utilisateur est enregistré dans la base de données
  
public String isSigned(String username, String password) {
    // Connexion à la base de données (vous devrez peut-être ajuster cela en fonction de votre configuration)
 
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
    
        // SQL query to check if the user exists with the provided username and password
        String query = "SELECT * FROM user WHERE username = ? AND password = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        resultSet = preparedStatement.executeQuery();

        // If a row is returned, it means the user exists
        if (resultSet.next()) {
            return resultSet.getString("role");
        }
        return null;
    } catch (SQLException e) {
        // Handle SQL exceptions
        e.printStackTrace(); // You can replace this with logging or custom exception handling
        return null;
    } finally {
        // Close resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            // Handle SQL exceptions during resource closing
            e.printStackTrace(); // You can replace this with logging or custom exception handling
        }
    }
}
    
// Method to retrieve all users
    public List<User> getAll() throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM user";
        try (PreparedStatement statement = connection.prepareStatement(query);
                ResultSet res = statement.executeQuery()) {
            while (res.next()) {
                int id = res.getByte("id");
                String username = res.getString("username");
                String password = res.getString("password");
                String role = res.getString("role");
                userList.add(new User(id,username,password,role));
            }
        }
        return userList;
    }

    // Method to save a new user
public void save(User user) throws SQLException {
    String query = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
    try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getPassword());
        statement.setString(3, user.getRole());

        int affectedRows = statement.executeUpdate();

        if (affectedRows == 0) {
            System.out.print("not inserted");
            throw new SQLException("L'insertion de l'utilisateur a échoué, aucune ligne affectée.");
        }

        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int userId = generatedKeys.getInt(1);
                user.setId(userId); // Mettre à jour l'ID de l'utilisateur avec celui généré
            } else {
                throw new SQLException("Échec de la récupération de l'ID généré pour l'utilisateur ajouté.");
            }
        }
    }


}
    // Method to update an existing user
public void update(User user) throws SQLException {
    String query = "UPDATE user SET username = ?, password = ?, role = ? WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getPassword());
        statement.setString(3, user.getRole());
        statement.setInt(4, user.getId());

        statement.executeUpdate();
    }
}

// Method to delete a user by ID
public void delete(int userId) throws SQLException {
    String query = "DELETE FROM user WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, userId);
        statement.executeUpdate();
    }
}
     public int getNombreUser() {
        int nbr = 0;
        String query = "SELECT count(*) as count FROM user"; // Utilisation de l'alias "count" pour obtenir le résultat
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
     
     // Méthode pour récupérer un utilisateur par son ID
    public User getUserById(int userId) throws SQLException {
        String query = "SELECT * FROM user WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    String password = resultSet.getString("password");
                    String role = resultSet.getString("role");
                    
                    return new User(id, username, password, role); // Retourner un objet User avec les détails récupérés
                }
            }
        }
        return null; // Retourner null si aucun utilisateur n'est trouvé avec cet ID
    }
    
    public int getLastInsertedId() throws SQLException {
    int lastInsertedId = -1;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        String query = "SELECT LAST_INSERT_ID() AS last_id"; // MySQL
        statement = connection.prepareStatement(query); // Utilisez l'instance de connexion existante
        
        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            lastInsertedId = resultSet.getInt("last_id");
        }
    } finally {
        // Fermez les ressources de manière sécurisée
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
        // Ne fermez pas la connexion ici, car elle doit être gérée de manière externe
    }

    return lastInsertedId;
}


}
