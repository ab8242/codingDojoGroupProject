package com.projectalgos.groupproject.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.projectalgos.groupproject.models.Question;
import com.projectalgos.groupproject.models.Quiz;
import com.projectalgos.groupproject.models.User;
import com.projectalgos.groupproject.services.QuestionService;
import com.projectalgos.groupproject.services.QuizService;
import com.projectalgos.groupproject.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class QuizController {

    @Autowired
    private QuizService quizServ;
    
    @Autowired
    private UserService userServ;
    
    @Autowired
	private QuestionService questionServ;
    
    @Autowired
    private HttpSession session;

    @GetMapping("/quiz/dashboard")
    public String dashboardPage(Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User user = userServ.findById(userId);
        model.addAttribute("loggedUser", user);
        return "quizDashboard.jsp";
    }

    @GetMapping("/quiz/start")
    public String newQuizPage(Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        List<Question> randomQuestions = quizServ.createQuiz(5);
		model.addAttribute("questions", randomQuestions);
        return "showQuiz.jsp";
    }

    @PostMapping("/quiz/result")
    public String result(@RequestParam Map<String, String> answers, Model model) {
        Map<Long, String> correctAnswers = questionServ.getCorrectAnswers();
        
        int score = calculateScore(answers, correctAnswers);
        model.addAttribute("score", score);
        return "result.jsp";
    }
    
    private int calculateScore(Map<String, String> answers, Map<Long, String> correctAnswers) {
    	int score = 0;
    	for(Map.Entry<String, String> entry: answers.entrySet()) {
    		Long questionId = Long.parseLong(entry.getKey());
    		String selectedAnswer = entry.getValue();
    		String correctAnswer = correctAnswers.get(questionId);
    		if(correctAnswer != null && correctAnswer.equals(selectedAnswer)) {
    			score++;
    			System.out.println(score);
    		}
    	}
    	return score;
    }


} // Do not delete

