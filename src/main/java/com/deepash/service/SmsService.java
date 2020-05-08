package com.deepash.service;

import org.springframework.stereotype.Service;

import com.deepash.modal.MessageBean;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmsService {
	private final static String ACCOUNT_SID = "AC80e0ae18800bc3ee793844c118b0a5d8";
	private final static String AUTH_ID = "e550155ba382e722cb7485b6de260736";

	static {
		Twilio.init(ACCOUNT_SID, AUTH_ID);
	}

	public void send() {
		Message.creator(new PhoneNumber("+917200691127"), new PhoneNumber("+18125779566"),
				"Hello Deepika Your Bus has reached gandhipuram next stop is urs\n thank you").create();
	}

	public void newMessage(String user, MessageBean m) {
		String phone = "", opp = "monika", rel = "husband";
		if (user.equals("monika")) {
			phone = "+917010809760";
			opp = "deepash";
			rel = "wife";
		}
		if (user.equals("deepash"))
			phone = "+918610585683";
		String type = "";
		if (m.getType().equals("normal"))
			type = ("normal message");
//		System.out.println(phone + " " + opp);
		Message.creator(new PhoneNumber(phone), new PhoneNumber("+18125779566"),
				".\nHello " + opp + "\n\nYour Best one has sent u a " + type + "\nVisit https://forus.herokuapp.com/"
						+ opp + "?id=" + m.getId() + "  to view the message\n\n Have a Nice Day " + opp)
				.create();

	}

}
