package model.service.quiz;

import model.entities.Question;
import model.entities.Quiz;
import model.service.IGeneral;

public interface IQuestion extends IGeneral<Question> {
    int getQuestionId(Question question);
}
