package model.entities;

public class SessionAnswer {
    private String question;
    private String answer;
    private int correct;

    public SessionAnswer() {
    }

    public SessionAnswer(String question, String answer, int correct) {
        this.question = question;
        this.answer = answer;
        this.correct = correct;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getCorrect() {
        return correct;
    }

    public void setCorrect(int correct) {
        this.correct = correct;
    }
}
