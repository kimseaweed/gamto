package com.ex.gamto.freeboard;

import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping("/board")
	public String userlistPage(Model model) {
		model.addAttribute("board",dao.listDao());
		
		return "board";
	}
	
	@RequestMapping("/freeview")
	public String freeview(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		return "freeview";
	}
	
	@RequestMapping("/freeWriteForm")
	public String freeWriteForm() {
		return "freeWriteForm";
	}
	
	@RequestMapping("/freeWrite")
	public String freeWrite(HttpServletRequest request, Model model) {
		String fName = request.getParameter("f_writer");
		String fTitle = request.getParameter("f_title");
		String fContent = request.getParameter("f_content");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fName);
		map.put("item2", fTitle);
		map.put("item3", fContent);
		
		return "redirect:board";
	}
	
	@RequestMapping("/freedelete")
	public String delete(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		
		return "redirect:board";
	}
}
