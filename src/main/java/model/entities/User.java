package model.entities;

public class User {
    private int id;
    private String name;
    private String userName;
    private String passWord;
    private String email;
    private int host;

    public User(){}

    public User(int id, String name, String userName, String passWord, String email, int host) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.passWord = passWord;
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

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getHost() {
        return host;
    }

    public void setHost(int host) {
        this.host = host;
    }
}
