package com.projectalgos.groupproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.projectalgos.groupproject.models.Quiz;

@Repository
public interface QuizRepository extends CrudRepository<Quiz, Long> {
	List<Quiz> findAll();
	
}// Do not delete