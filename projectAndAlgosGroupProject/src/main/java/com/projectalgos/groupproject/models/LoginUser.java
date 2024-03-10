package com.projectalgos.groupproject.models;

import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class LoginUser {
	@NotEmpty(message="Please enter an email")
	@Email(message="Email is invalid")
	private String email;
	
	@NotEmpty(message="Please enter a password")
	@Size(min=8, max=255, message="Password must be 8 to 255 characters")
	@Column(columnDefinition="TEXT")
	private String password;

	public LoginUser() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
