package model.entities;

public class QuizPlay {
    private String content;
    private int idQuestion;
    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;
    private int answer1_id;
    private int answer2_id;
    private int answer3_id;
    private int answer4_id;

    public QuizPlay() {
    }

    public QuizPlay(String content, int idQuestion, String answer1, String answer2, String answer3, String answer4, int answer1_id, int answer2_id, int answer3_id, int answer4_id) {
        this.content = content;
        this.idQuestion = idQuestion;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.answer4 = answer4;
        this.answer1_id = answer1_id;
        this.answer2_id = answer2_id;
        this.answer3_id = answer3_id;
        this.answer4_id = answer4_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public int getAnswer1_id() {
        return answer1_id;
    }

    public void setAnswer1_id(int answer1_id) {
        this.answer1_id = answer1_id;
    }

    public int getAnswer2_id() {
        return answer2_id;
    }

    public void setAnswer2_id(int answer2_id) {
        this.answer2_id = answer2_id;
    }

    public int getAnswer3_id() {
        return answer3_id;
    }

    public void setAnswer3_id(int answer3_id) {
        this.answer3_id = answer3_id;
    }

    public int getAnswer4_id() {
        return answer4_id;
    }

    public void setAnswer4_id(int answer4_id) {
        this.answer4_id = answer4_id;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }
}
