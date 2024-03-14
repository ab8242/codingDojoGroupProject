package com.projectalgos.groupproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.projectalgos.groupproject.models.Question;



@Repository
public interface QuestionRepository extends CrudRepository<Question, Long> {
	List<Question> findAll();
	
	@Query(value = "SELECT * FROM questions ORDER BY RANDOM() LIMIT ?1", nativeQuery = true)
	List<Question> findRandomQuestions(int limit);

}
