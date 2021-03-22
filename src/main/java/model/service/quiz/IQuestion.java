package model.service.quiz;

import model.entities.Question;
import model.entities.Questions;
import model.entities.Quiz;
import model.service.IGeneral;

import java.util.List;

public interface IQuestion extends IGeneral<Question> {
    int getQuestionId(Question question);
    List<Questions> getQuestions(int id);
}
