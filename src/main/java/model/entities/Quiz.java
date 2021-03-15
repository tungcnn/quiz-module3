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
}
