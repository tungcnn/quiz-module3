package model.entities;

public class PlayerAnswer {
    private int id_session;
    private int id_question;
    private int id_answer;

    public PlayerAnswer(int id_session, int id_question, int id_answer) {
        this.id_session = id_session;
        this.id_question = id_question;
        this.id_answer = id_answer;
    }

    public PlayerAnswer() {
    }

    public int getId_session() {
        return id_session;
    }

    public void setId_session(int id_session) {
        this.id_session = id_session;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public int getId_answer() {
        return id_answer;
    }

    public void setId_answer(int id_answer) {
        this.id_answer = id_answer;
    }
}
