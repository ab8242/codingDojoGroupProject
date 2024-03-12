package com.projectalgos.groupproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.projectalgos.groupproject.models.LoginUser;
import com.projectalgos.groupproject.models.User;
import com.projectalgos.groupproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	private UserService userServ;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/")
	public String loginRegPage(@ModelAttribute("registerUser") User registerUser, @ModelAttribute("loginUser") LoginUser loginUser) {
		return "LoginReg.jsp";
	}
	@GetMapping("/dashboard")
	public String dashboardPage(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User foundUserOrNull = userServ.findById(userId);
		model.addAttribute("loggedUser", foundUserOrNull);
		return "dashboard.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("registerUser") User registerUser, BindingResult result, Model model) {
		User registeredUserOrNull = userServ.validateRegistration(registerUser, result);
		if (registeredUserOrNull == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "LoginReg.jsp";
		}
		session.setAttribute("userId", registeredUserOrNull.getId());
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model) {
		User loggedUserOrNull = userServ.validateLogin(loginUser, result);
		if (loggedUserOrNull == null) {
			model.addAttribute("registerUser", new User());
			return "LoginReg.jsp";
		}
		session.setAttribute("userId", loggedUserOrNull.getId());
		return "redirect:/dashboard";
	}
	
	@PostMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
}
