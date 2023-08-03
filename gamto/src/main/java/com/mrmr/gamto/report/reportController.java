package com.mrmr.gamto.report;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.report.dao.IBook_reportDAO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class reportController {
	@Autowired
	IBook_reportDAO dao;
	
	@RequestMapping("/list")
	public String userlistPage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "list";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		model.addAttribute("dto", dao.viewDao(rId));
		return "view";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		String rName = request.getParameter("r_writer");
		String rTitle = request.getParameter("r_title");
		String rContent = request.getParameter("r_content");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", rName);
		map.put("item2", rTitle);
		map.put("item3", rContent);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("r_seq_number"));
		return "redirect:list";
	}
}
