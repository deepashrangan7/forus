package com.deepash.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.aspectj.apache.bcel.generic.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.deepash.modal.MessageBean;
import com.deepash.modal.TypeBean;
import com.deepash.respository.MessageRepository;

@Service
public class SendService {

	@Autowired
	private MessageRepository msg;
	@Autowired
	private SmsService sms;

	@Transactional
	public boolean send(MessageBean m) {
		boolean flag = false;
		msg.save(m);
		try {
//			if (m.getType().equals("kavithai"))
				sms.newMessage(m.getWho(), m);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("message not sent " + e.getMessage());
		}
//		System.out.println(m);
		return flag;
	}

	public List<MessageBean> getAllMsg(Integer pg, TypeBean type) {
//		= msg.getAllMsg(PageRequest.of(pg, 3), Sort.by(Direction.DESC, "d"));
		if (pg == null)
			pg = 0;

		Pageable page = PageRequest.of(pg, 3, Sort.by("d").descending());

		List<MessageBean> obj = new ArrayList<>();
		if (type.getType() == null)
			type.setType("all");
		if (type.getType().equals("all")) {
			Page<MessageBean> obj1 = msg.findAll(page);
			if (obj1.hasContent()) {
				obj = obj1.getContent();
			}
		} // all
		else if (type.getType().equals("normal")) {
			obj = msg.getAllNormal(page);
		} else {
			obj = msg.getAllKavithai(page);
		}

		return obj;
	}

	public int size(String type) {
		int size = 0;
		List<MessageBean> m = new ArrayList<>();
		if (type.equals("all"))
			size = msg.getAllSize().size();
		else if (type.equals("normal")) {
			size = msg.getAllNormalSize().size();
		} else {
			size = msg.getAllKavithaiSize().size();
		}
		if (size % 3 == 0)
			size = size / 3;
		else
			size = (size / 3) + 1;
		System.out.println(size + " size");
		return size;
	}

	public MessageBean findtat(Integer id) {
		
		return msg.findById(id).get();
		
	}
}
