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
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fTitle);
		map.put("item2", fContent);
		map.put("item3", fId);
		dao.updateDao(map);

		return "redirect:/board";
	}
	
	@RequestMapping("/good")
	public String goodCount(HttpServletRequest request, Model model) {
		System.out.println("good출력");
		String fId = request.getParameter("f_seq_number");
		dao.goodCnt(fId);
		 
		return "redirect:/board";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		dao.deleteDao(fId);
		return "redirect:/board";
	}
	
	@RequestMapping("/viewComment")
	public String viewComment(HttpServletRequest request, Model model ) {
		String fId = request.getParameter("f_seq_number"); 
		model.addAttribute("dto",dao.viewDao(fId));
		model.addAttribute("cDto",dao.cListDao());
		
		return "/viewComment";
	}
	
	@RequestMapping("/insertCommend")
	public String insertCommend(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("dto",dao.viewDao(fId));
		model.addAttribute("cDto",dao.cListDao());
		
		String fName = "세션에 저장된 작성자";		
		String fContent = request.getParameter("c_content");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fName);
		map.put("item2", fContent);
		dao.cWriteDao(map);
		
		return "redirect:/viewComment?f_seq_number="+fId;
	}
	
	@RequestMapping("/cGoodCnt")
	public String commentGoodButton(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cGoodCnt(cId);
		 
		return "redirect:/viewComment?f_seq_number="+fId;	
	}
	
	@RequestMapping("/cBadCnt")
	public String commentBadButton(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cBadCnt(cId);
		 
		return "redirect:/viewComment?f_seq_number="+fId;	
	}
	
	
	@RequestMapping("/cUpdateForm")
	public String commentUpdateForm(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		model.addAttribute("cDto",dao.cViewDao(cId));
		
		return "/commentUpdateForm";
	}
	
	@RequestMapping("/cUpdate")
	public String commentUpdate(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cContent = request.getParameter("c_content");
		String cId = request.getParameter("c_seq_number");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", cContent);
		map.put("item2", cId);
		dao.cUpdateDao(map);
		
		return "redirect:/viewComment?f_seq_number="+fId;
	}
	
	@RequestMapping("/cDelete")
	public String commentDelete(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cDeleteDao(cId);
		
		return "redirect:/viewComment?f_seq_number="+fId;
	}
	
	
}