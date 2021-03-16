package model.entities;

public class Quiz {
    private int id;
    private String name;
    private String difficulty;

    public Quiz() {
    }

    public Quiz(int id, String name, String difficulty) {
        this.id = id;
        this.name = name;
        this.difficulty = difficulty;
    }

    public Quiz(String name, String difficulty) {
        this.name = name;
        this.difficulty = difficulty;
    }

    public int getId() {
        return id;
    }


    public String getName() {
        return name;
    }

    public String getDifficulty() {
        return difficulty;
    }
}
