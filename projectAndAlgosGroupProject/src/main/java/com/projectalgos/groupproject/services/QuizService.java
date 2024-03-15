package com.projectalgos.groupproject.services;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectalgos.groupproject.models.Question;
import com.projectalgos.groupproject.models.Quiz;
import com.projectalgos.groupproject.repositories.QuestionRepository;
import com.projectalgos.groupproject.repositories.QuizRepository;

@Service
public class QuizService {
    
    @Autowired
    private QuizRepository quizRepo;
    
    @Autowired
    private QuestionRepository questionRepo;
    
    public List<Question> createQuiz(int numQuestions) {
        List<Question> questions = questionRepo.findRandomQuestions(numQuestions);
        Collections.shuffle(questions);
        return questions.subList(0, Math.min(numQuestions, questions.size()));
    }
    
    public Quiz saveQuiz(Quiz quiz) {
        return quizRepo.save(quiz);
    }
    public List<Quiz> getAllQuizzes() {
        return quizRepo.findAll();
    }
    
    public Quiz getQuizById(Long id) {
        Optional<Quiz> quizOrNull = quizRepo.findById(id);
        return quizOrNull.orElse(null);
    }
    
    public Quiz updateQuiz(Quiz editedQuiz) {
        return quizRepo.save(editedQuiz);
    }

    
    public void deleteQuiz(Long id) {
        quizRepo.deleteById(id);
    }
}
