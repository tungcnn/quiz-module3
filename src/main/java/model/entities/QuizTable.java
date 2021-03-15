package model.entities;

public class QuizTable {
    private int id;
    private String name;
    private String difficulty;
    private String author;

    public QuizTable(int id, String name, String difficulty, String author) {
        this.id = id;
        this.name = name;
        this.difficulty = difficulty;
        this.author = author;
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

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
