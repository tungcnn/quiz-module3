package model.entities;

public class Session {
    private int id;
    private int id_user;
    private int id_quiz;
    private int score;

    public Session(int id, int id_user, int id_quiz, int score) {
        this.id = id;
        this.id_user = id_user;
        this.id_quiz = id_quiz;
        this.score = score;
    }

    public Session(int id_user, int id_quiz, int score) {
        this.id_user = id_user;
        this.id_quiz = id_quiz;
        this.score = score;
    }

    public Session() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
