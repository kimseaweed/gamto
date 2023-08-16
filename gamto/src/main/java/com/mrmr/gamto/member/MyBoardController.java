package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.member.dao.MemberDAO;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping()
public class MyBoardController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("/myboard")
	public String MyBoardDao(HttpSession session, Model model) {
		String u_id = (String)session.getAttribute("u_id");
		System.out.println("u_id : "+u_id);
		model.addAttribute("list", dao.MyBoardDao(u_id,u_id));
		return "/member/myBoard";
	}
	
}
