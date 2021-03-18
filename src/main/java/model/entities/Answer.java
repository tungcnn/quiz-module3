package model.entities;

public class Answer {
    private int id;
    private int id_question;
    private int id_quiz;
    private String content;
    private int correct = 0;

    public Answer() {
    }

    public Answer(int id, int id_question, int id_quiz, String content, int correct) {
        this.id = id;
        this.id_question = id_question;
        this.id_quiz = id_quiz;
        this.content = content;
        this.correct = correct;
    }

    public Answer(int id_question, int id_quiz, String content, int correct) {
        this.id_question = id_question;
        this.id_quiz = id_quiz;
        this.content = content;
        this.correct = correct;
    }

    public Answer(int id_question, int id_quiz, String content) {
        this.id_question = id_question;
        this.id_quiz = id_quiz;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCorrect() {
        return correct;
    }

    public void setCorrect(int correct) {
        this.correct = correct;
    }
}
