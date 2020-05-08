package com.deepash.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.deepash.modal.MessageBean;
import com.deepash.modal.TypeBean;
import com.deepash.service.SendService;

@Controller
public class SendController {

	@Autowired
	private SendService send;

	@RequestMapping("/specific")
	public String getMessage(Integer id,Model mod) {
		
		MessageBean m=send.findtat(id);
		mod.addAttribute("spec", m);
		return "specific";
	}

	@RequestMapping("/home")
	public String home(HttpSession s) {
		String user = (String) s.getAttribute("user");
		s.setAttribute("home", true);
		return "redirect:" + user;
	}

	@RequestMapping("/send")
	public String send(String type, String message, HttpSession s) {
//		System.out.println(type + " \n " + message);
		String user = (String) s.getAttribute("user");
		if (type != null && message != null && type != "" && message != "") {
			MessageBean m = new MessageBean();
			m.setType(type);
			m.setWho(user);
			m.setMessage(message);
			send.send(m);
		}
		return "send";
	}

	@RequestMapping("/read")
	public String read(@ModelAttribute("ty") TypeBean type, String typ, Integer pg, Model m) {
		if (pg == null)
			pg = 0;
		if (typ != null) {
			type.setType(typ);
			m.addAttribute("ty", type);
		}

		if (type.getType() == null || type.getType().equals("all")) {
			type.setType("all");
			m.addAttribute("type", "All Messages");
		} else if (type.getType().equals("normal")) {

			m.addAttribute("type", "Normal Messages");

		} else {
			m.addAttribute("type", "Kavithai for my pattu");

		}

		m.addAttribute("messages", send.getAllMsg(pg, type));
		m.addAttribute("size", send.size(type.getType().trim()));
		m.addAttribute("pg", pg);
		return "read";
	}
}
