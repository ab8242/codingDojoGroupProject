package com.projectalgos.groupproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import com.projectalgos.groupproject.models.Quiz;
import com.projectalgos.groupproject.models.User;
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
	private HttpSession session;
	
	@GetMapping("/quiz/create")
	public String newQuizPage(@ModelAttribute("newQuiz") Quiz newQuiz, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		return "newQuiz.jsp";
	}
	
	@PostMapping("/quiz/create")
	public String createQuiz(@Valid @ModelAttribute("newQiuz") Quiz newQuiz, BindingResult result, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		if (result.hasErrors()) {
			model.addAttribute("loggedUser", foundUser);
			return "newQuiz.jsp";
		}
		quizServ.createQuiz(newQuiz);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/quiz/{id}")
	public String showQuiz(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		Quiz quiz = quizServ.getQuizById(id);
		model.addAttribute("quiz", quiz);
		return "showQuiz.jsp";
	}
	
	@GetMapping ("/quiz/{id}/edit")
	public String editQuizPage(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		Quiz thisQuiz = quizServ.getQuizById(id);
		model.addAttribute("editQuiz", thisQuiz);
		return "editQuiz.jsp";
	}
	
	@PutMapping("/quiz/{id}/edit")
	public String editQuiz(@PathVariable("id") Long id, @Valid @ModelAttribute("editedQuiz") Quiz editedQuiz, BindingResult result, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		if (result.hasErrors()) {
			model.addAttribute("loggedUser", foundUser);
			return "editQuiz.jsp";
		}
		quizServ.updateQuiz(editedQuiz);
		return "redirect:/dashboard";
	}
	
	@DeleteMapping("/quiz/{id}/delete")
	public String deleteQuiz(@PathVariable("id") Long id) {
		quizServ.deleteQuiz(id);
		return "redirect:/dashboard";
	}
	
} // Do not delete