package com.projectalgos.groupproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.projectalgos.groupproject.models.LoginUser;
import com.projectalgos.groupproject.models.User;
import com.projectalgos.groupproject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User validateRegistration(User registerUser, BindingResult result) {
		if(!registerUser.getPassword().equals(registerUser.getConfirmPassword())) {
			result.rejectValue("password", "passwordsDisagree.registerUser.password", "Passwords do not agree");
			
		}
		Optional<User> possibleUser = userRepo.findByEmail(registerUser.getEmail());
		if (possibleUser.isPresent()) {
			result.rejectValue("email", "emailTaken.registerUser.email", "Someone already registered with that email");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashedPassword = BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt());
		registerUser.setPassword(hashedPassword);
		return userRepo.save(registerUser);
	}

	public User validateLogin(LoginUser loginUser, BindingResult result) {
		Optional<User> possibleUser = userRepo.findByEmail(loginUser.getEmail());
		if (possibleUser.isEmpty()) {
			result.rejectValue("email", "invalidCredentials.loginUser.email", "Invalid login Credentials");
			return null;
		}
		User thisUser = possibleUser.get();
		if (!BCrypt.checkpw(loginUser.getPassword(), thisUser.getPassword())) {
			result.rejectValue("email", "invalidCredentials.loginUser.email", "Invalid login Credentials");
			return null;
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return thisUser;
		}
	}
	
	public User findById(Long id) {
		Optional<User> possibleUser = userRepo.findById(id);
		return possibleUser.isPresent() ? possibleUser.get() : null;
	}
	
}
