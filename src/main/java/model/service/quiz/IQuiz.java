package model.service.quiz;

import model.entities.Quiz;
import model.service.IGeneral;

public interface IQuiz extends IGeneral<Quiz> {
     int getQuizId(Quiz quiz);
     boolean deleteQuestion(int id);
}
