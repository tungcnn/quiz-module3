package model.entities;

public class SessionView {
    private int sessionID;
    private String quizName;
    private String quizDifficulty;
    private int score;

    public SessionView(int sessionID, String quizName, String quizDifficulty, int score) {
        this.sessionID = sessionID;
        this.quizName = quizName;
        this.quizDifficulty = quizDifficulty;
        this.score = score;
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
}
