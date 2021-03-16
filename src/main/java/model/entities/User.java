package model.entities;

public class User {
    private int id;
    private String name;
    private String userName;
    private String passWorrd;
    private String email;
    private boolean host;

    public User(){}

    public User(int id, String name, String userName, String passWorrd, String email, boolean host) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.passWorrd = passWorrd;
        this.email = email;
        this.host = host;
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

    public String getPassWorrd() {
        return passWorrd;
    }

    public void setPassWorrd(String passWorrd) {
        this.passWorrd = passWorrd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isHost() {
        return host;
    }

    public void setHost(boolean host) {
        this.host = host;
    }
}
