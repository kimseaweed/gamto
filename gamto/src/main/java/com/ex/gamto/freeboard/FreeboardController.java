package com.ex.gamto.freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ex.gamto.freeboard.dao.IFreeboardDao;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FreeboardController {
	@Autowired
	IFreeboardDao dao;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:board";
	}
	
	@RequestMapping("/board")
	public String userlistPage(Model model) {
		model.addAttribute("board",dao.listDao());
		
		return "board";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		return "view";
	}
	
}
