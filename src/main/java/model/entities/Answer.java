package model.entities;

public class Answer {
    private int id;
    private int id_question;
    private int id_quiz;
    private String content;
    private byte correct;

    public Answer() {
    }

    public Answer(int id, int id_question, int id_quiz, String content, byte correct) {
        this.id = id;
        this.id_question = id_question;
        this.id_quiz = id_quiz;
        this.content = content;
        this.correct = correct;
    }

    public Answer(int id_question, int id_quiz, String content, byte correct) {
        this.id_question = id_question;
        this.id_quiz = id_quiz;
        this.content = content;
        this.correct = correct;
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

    public byte getCorrect() {
        return correct;
    }

    public void setCorrect(byte correct) {
        this.correct = correct;
    }
}
