package com.deepash.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.deepash.service.AuthService;

@Controller
public class MainController {

	@Autowired
	private AuthService auth;

	@GetMapping("/")
	public String choose() {

		return "chooserole";
	}

	@RequestMapping("/monika")
	public String monika(String password, Model m, HttpSession s) {
		Boolean flag = (Boolean) s.getAttribute("home");
//		System.out.println(flag);
		s.setAttribute("user", "monika");
		if (flag != null && flag == true) {
			m.addAttribute("auth", true);

			s.setAttribute("home", false);
			return "monika";
		}
		if (password == null || password.equals("") || password.equals(" ")) {
			m.addAttribute("auth", false);
		} else {
			if (auth.isValid(password)) {
				m.addAttribute("auth", true);

				m.addAttribute("err", "");
			} else {
				m.addAttribute("auth", false);
				m.addAttribute("err", "password doesn't match");
			}
		}
		return "monika";
	}

	@RequestMapping("/deepash")
	public String deepash(String password, Model m, HttpSession s) {
		Boolean flag = (Boolean) s.getAttribute("home");
//		System.out.println(flag);
		s.setAttribute("user", "deepash");
		if (flag != null && flag == true) {
			m.addAttribute("auth", true);
			s.setAttribute("home", false);
			return "deepash";

		}

		if (password == null || password.equals("") || password.equals(" "))
			m.addAttribute("auth", false);
		else {
			if (auth.isValid(password)) {
				m.addAttribute("auth", true);
				m.addAttribute("err", "");
			} else {
				m.addAttribute("auth", false);
				m.addAttribute("err", "password doesn't match");

			}
		}
		return "deepash";
	}

}
