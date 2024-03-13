package com.projectalgos.groupproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectalgos.groupproject.models.Question;
import com.projectalgos.groupproject.repositories.QuestionRepository;


@Service
public class QuestionService {
	@Autowired
	private QuestionRepository questionRepo;
	
	public Question createQuestion(Question newQuestion) {
        return questionRepo.save(newQuestion);
    }

    public List<Question> getAllQuestions() {
        return questionRepo.findAll();
    }

    public Question getQuestionById(Long id) {
    	Optional<Question>questionOrNull = questionRepo.findById(id);
		return questionOrNull.isPresent() ? questionOrNull.get() : null;
    }

    public Question updateQuestion(Question editedQuestion) {
        return questionRepo.save(editedQuestion);
    }

    public void deleteQuestion(Long id) {
        questionRepo.deleteById(id);
    }
    

}
