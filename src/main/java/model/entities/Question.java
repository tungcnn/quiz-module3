package model.entities;

public class Question {
    private int id;
    private String content;
    private int id_quiz;

    public Question() {
    }

    public Question(String content, int id_quiz) {
        this.content = content;
        this.id_quiz = id_quiz;
    }

    public Question(int id, String content, int id_quiz) {
        this.id = id;
        this.content = content;
        this.id_quiz = id_quiz;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }
}
