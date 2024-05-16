
package com.mycompany.auto_ecole_web.model;


public class User {

    private int id;
    private String username;
    private String password;
    private String role;

    public User() {
    }

    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
      
    }

    // Constructeur avec paramètres
    public User(int id, String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role=role;
    }

    // Getter pour l'ID
    public int getId() {
        return id;
    }

    // Setter pour l'ID
    public void setId(int id) {
        this.id = id;
    }

    // Getter pour le nom
    public String getUsername() {
        return username;
    }

    // Setter pour le nom
    public void setNom(String username) {
        this.username = username;
    }

    // Getter pour le prénom
    public String getPassword() {
        return password;
    }

    // Setter pour le prénom
    public void setPassword(String password) {
        this.password = password;
    }

    // Getter pour l'adresse
    public String getRole() {
        return role;
    }

    // Setter pour l'adresse
    public void setRole(String role) {
        this.role = role;
    }

   

}
