package com.deepash.service;

import org.springframework.stereotype.Service;

@Service
public class AuthService {

	public boolean isValid(String password) {
		if (password.equalsIgnoreCase("071229"))
			return true;
		return false;
	}

}
