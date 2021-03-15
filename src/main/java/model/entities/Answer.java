package model.entities;

public class Answer {
    private int id;
    private int id_quiz;
    private int id_question;
    private String content;
    private byte correct;

    public Answer() {
    }

    public Answer(int id, int id_quiz, int id_question, String content, byte correct) {
        this.id = id;
        this.id_quiz = id_quiz;
        this.id_question = id_question;
        this.content = content;
        this.correct = correct;
    }

    public Answer(int id_quiz, int id_question, String content, byte correct) {
        this.id_quiz = id_quiz;
        this.id_question = id_question;
        this.content = content;
        this.correct = correct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
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
