package com.projectalgos.groupproject.controllers;

import java.util.List;

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

import com.projectalgos.groupproject.models.Question;
import com.projectalgos.groupproject.models.User;
import com.projectalgos.groupproject.services.QuestionService;
import com.projectalgos.groupproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionServ;
	@Autowired
	private UserService userServ;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/questions/add")
	public String newQuestionFormPage(@ModelAttribute("newQuestion") Question newQuestion, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		return "newQuestion.jsp";
	}
	
	
	@PostMapping("/questions/add")
	public String addAQuestion(@Valid @ModelAttribute("newQuestion") Question newQuestion, BindingResult result, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		if (result.hasErrors()) {
			model.addAttribute("loggedUser", foundUser);
			return "newQuestion.jsp";
		}
		questionServ.createQuestion(newQuestion);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/questions/{id}")
	public String showQuestion(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		Question question = questionServ.getQuestionById(id);
		model.addAttribute("question", question);
		return "showQuestion.jsp";
	}
	
	@GetMapping ("/questions/{id}/edit")
	public String editQuestionPage(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		Question thisQuestion = questionServ.getQuestionById(id);
		model.addAttribute("editQuestion", thisQuestion);
		return "editQuestion.jsp";
	}
	
	
	
	
	@PutMapping("/questions/{id}/edit")
	public String editQuestion(@PathVariable("id") Long id, @Valid @ModelAttribute("editedQuestion") Question editedQuestion, BindingResult result, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUser = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUser);
		if (result.hasErrors()) {
			model.addAttribute("loggedUser", foundUser);
			return "editQuestion.jsp";
		}
		questionServ.updateQuestion(editedQuestion);
		return "redirect:/dashboard";
	}
	
	@DeleteMapping("/questions/{id}/delete")
	public String deleteQuestion(@PathVariable("id") Long id) {
		questionServ.deleteQuestion(id);
		return "redirect:/dashboard";
	}
	
	

}
