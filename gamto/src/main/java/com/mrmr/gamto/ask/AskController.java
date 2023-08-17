package com.mrmr.gamto.ask;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/ask")
public class AskController {


	
	@RequestMapping("/{pageNo}")
	public String askboard(HttpSession session,Model model,@PathVariable("pageNo")int pageNo) {
		if(session.getAttribute("u_id")==null||((String)session.getAttribute("u_id")).equals("admin")) {
			model.addAttribute("script", "<script>alert(잘못된 접근입니다.); location='/'; </script>");
			return "script";					
		}else {			
			
			
			//dao.askPageDao(-)
			//dao.askListDao(pageNo)
			model.addAttribute("MaxPageNo","");
			model.addAttribute("askList","");
			return "ask/askBoard";
		}
	}
	@GetMapping("/view/{a_seq_number}")
	public String askview(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number) {
		if(session.getAttribute("u_id")==null||((String)session.getAttribute("u_id")).equals("admin")) {
			model.addAttribute("script", "<script>alert(잘못된 접근입니다.); location='/'; </script>");
			return "script";					
		}else {
			
			//dao.askViewDao(a_seq_number)
			model.addAttribute("askView","");
			return "ask/askPage";
		}
	}
	@ResponseBody
	@PutMapping("/view/{a_seq_number}")
	public String askviewPut(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number,int a_complete) {
		if(session.getAttribute("u_id")==null||((String)session.getAttribute("u_id")).equals("admin")) {
			model.addAttribute("script", "<script>alert(잘못된 접근입니다.); location='/'; </script>");
			return "script";					
		}else {
			
			//dao.askUpdateComplete(a_complete);
			return "0";//성공			
		}
	}
	@GetMapping("/search")
	public String asksearch(HttpSession session,Model model,int pageNo,String a_category,String query,String pageNum) {
		if(session.getAttribute("u_id")==null||((String)session.getAttribute("u_id")).equals("admin")) {
			model.addAttribute("script", "<script>alert(잘못된 접근입니다.); location='/'; </script>");
			return "script";					
		}else {
			
			//dao.askSearchPageDao(a_category,)
			//dao.askSearchListDao(pageNo)
			model.addAttribute("MaxPageNo","");
			model.addAttribute("askList","");
			return "ask/askBoard";
		}
	}
	
	
	
}
