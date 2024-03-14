package com.projectalgos.groupproject.controllers;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation;
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
        model.addAttribute("newQuiz", new Quiz());
        List<Question> getAll = questionServ.getAllQuestions();
		model.addAttribute("questions", getAll);
        return "showQuiz.jsp";
    }

    @PostMapping("/quiz/start")
    public String createQuiz(@Valid @ModelAttribute("newQuiz") Quiz newQuiz, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "showQuiz.jsp";
        }
        Long userId = (Long) session.getAttribute("userId");
        User user = userServ.findById(userId);
        newQuiz.setQuizCreator(user);
        quizServ.saveQuiz(newQuiz);
        return "redirect:/quiz/dashboard";
    }

    @GetMapping("/quiz/{id}")
    public String showQuiz(Model model, @PathVariable("id") Long id) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User foundUser = userServ.findById(userId);
        model.addAttribute("loggedUser", foundUser);
        Quiz quiz = quizServ.getQuizById(id);
        model.addAttribute("quiz", quiz);
        return "showQuiz.jsp";
    }

    @GetMapping("/quiz/{id}/edit")
    public String editQuizPage(@PathVariable("id") Long id, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User foundUser = userServ.findById(userId);
        model.addAttribute("loggedUser", foundUser);
        Quiz thisQuiz = quizServ.getQuizById(id);
        model.addAttribute("editQuiz", thisQuiz);
        return "showQuiz.jsp";

    }

    @PutMapping("/quiz/{id}/edit")
    public String editQuiz(@PathVariable("id") Long id, @Valid @ModelAttribute("editedQuiz") Quiz editedQuiz, BindingResult result, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User foundUser = userServ.findById(userId);
        model.addAttribute("loggedUser", foundUser);
        if (result.hasErrors()) {
            model.addAttribute("loggedUser", foundUser);
            return "showQuiz.jsp";

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

