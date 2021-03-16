package model.entities;

public class User {
    private int id;
    private String name;
    private String userName;
    private String password;
    private String email;
    private byte correct;

    public User() {
    }

    public User(int id, String name, String userName, String password, String email, byte correct) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.correct = correct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public byte getCorrect() {
        return correct;
    }

    public void setCorrect(byte correct) {
        this.correct = correct;
    }
}
