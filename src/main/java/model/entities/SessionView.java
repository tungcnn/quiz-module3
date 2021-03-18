package model.entities;

import java.util.Date;

public class SessionView {
    private int sessionID;
    private String quizName;
    private String quizDifficulty;
    private int score;
    private String date;

    public SessionView(int sessionID, String quizName, String quizDifficulty, int score, String date) {
        this.sessionID = sessionID;
        this.quizName = quizName;
        this.quizDifficulty = quizDifficulty;
        this.score = score;
        this.date = date;
    }

    public SessionView() {
    }

    public int getSessionID() {
        return sessionID;
    }

    public void setSessionID(int sessionID) {
        this.sessionID = sessionID;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public String getQuizDifficulty() {
        return quizDifficulty;
    }

    public void setQuizDifficulty(String quizDifficulty) {
        this.quizDifficulty = quizDifficulty;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
