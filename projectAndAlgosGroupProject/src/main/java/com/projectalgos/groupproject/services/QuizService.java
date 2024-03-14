package com.projectalgos.groupproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectalgos.groupproject.models.Quiz;
import com.projectalgos.groupproject.repositories.QuizRepository;

@Service
public class QuizService {
	
	@Autowired
	private QuizRepository quizRepo;
	
	public Quiz createQuiz (Quiz newQuiz) {
		return quizRepo.save(newQuiz);
	}
	
	public List<Quiz> getAllQuizzes() {
		return quizRepo.findAll();
	}
	
	public Quiz getQuizById(Long id) {
		Optional<Quiz>quizOrNull = quizRepo.findById(id);
		return quizOrNull.isPresent() ? quizOrNull.get(): null;
	}
	
	public Quiz updateQuiz(Quiz editedQuiz) {
		return quizRepo.save(editedQuiz);
	}
	
	public void deleteQuiz(Long id) {
		quizRepo.deleteById(id);
	}
}// Do not delete
