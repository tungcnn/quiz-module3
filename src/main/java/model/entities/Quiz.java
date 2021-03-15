package model.entities;

public class Quiz {
    private int id;
    private int id_user;
    private String name;
    private String difficulty;

    public Quiz() {
    }

    public Quiz(int id, int id_user, String name, String difficulty) {
        this.id = id;
        this.id_user = id_user;
        this.name = name;
        this.difficulty = difficulty;
    }

    public Quiz(int id_user, String name, String difficulty) {
        this.id_user = id_user;
        this.name = name;
        this.difficulty = difficulty;
    }

    public int getId() {
        return id;
    }

    public int getId_user() {
        return id_user;
    }

    public String getName() {
        return name;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }
}
