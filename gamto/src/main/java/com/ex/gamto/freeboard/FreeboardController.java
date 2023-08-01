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
	
	@RequestMapping("")
	public String root() {
		return "redirect:board";
	}
	
	@RequestMapping("/board")
	public String userlistPage(Model model) {
		model.addAttribute("board",dao.listDao());
		
		return "/board";
	}
	
	@RequestMapping("/view")
	public String freeview(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		dao.updateCnt(fId);
		return "/view";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String freeWrite(HttpServletRequest request, Model model) {
		String fTitle = request.getParameter("f_title");
		String fName = request.getParameter("f_writer");		
		String fContent = request.getParameter("f_content");
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fTitle);
		map.put("item2", fName);
		map.put("item3", fContent);
		dao.writeDao(map);
		
		return "redirect:/board";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("updateForm", dao.viewDao(fId));
		
		return "/updateForm";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		String fTitle = request.getParameter("f_title");		
		String fContent = request.getParameter("f_content");
		String fId = request.getParameter("f_seq_number");
		
		System.out.println(fTitle);
		System.out.println(fContent);
		System.out.println(fId);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fTitle);
		map.put("item2", fContent);
		map.put("item3", fId);
		dao.updateDao(map);
		
		/* dao.updateDao(fTitle, fContent, fId); */
		
		return "redirect:/board";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		dao.deleteDao(fId);
		return "redirect:/board";
	}
}