package com.mrmr.gamto.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrmr.gamto.admin.dao.AdminDAO;
import com.mrmr.gamto.help.dto.AccuseDTO;
import com.mrmr.gamto.help.dto.AskDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDAO dao;

	/*** ask 문의관리기능 ***/
	@RequestMapping("/ask")
	public String askboard() {
		return"redirect:ask/20/1";
	}	
	@RequestMapping("/ask/{onePageNo}/{pageNo}")
	public String askboard( Model model,@PathVariable String onePageNo,@PathVariable String pageNo,String changePageNo) {	
		log.debug("askboard 요청"+pageNo+"페이지를"+onePageNo+"개 요청");
		if(changePageNo!=null) {
			if(!changePageNo.equals(onePageNo)) {
			log.debug(changePageNo+"개 표시로 바꿔달라는 request가 있습니다."); 
			return "redirect:/admin/ask/"+changePageNo+"/"+pageNo;
			}
		}
		List<AskDTO> list = dao.askListDao(pageNo,onePageNo);
		if(list.size()>0) {
			model.addAttribute("askList",list);
			model.addAttribute("pageNo",pageNo);
			model.addAttribute("onePageNo",onePageNo);
		}else {
			log.debug("askboard 요청 처리결과 : 값이 없습니다.");
		}
		return "admin/askBoard";
	}
	@GetMapping("/ask/view/{a_seq_number}")
	public String askview(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number) {
			AskDTO dto = dao.askViewDao(a_seq_number);
			model.addAttribute("dto",dto);
			return "admin/askPage";
	}
	@ResponseBody
	@PutMapping("/ask/view/{a_seq_number}")
	public int askviewPut(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number,String a_complete) {
		int res = dao.askUpdateComplete(a_seq_number, a_complete);
		return res; //1성공 0실패
	}
	
	@GetMapping("/ask/{a_seq_number}/file")
	public String askFile(@PathVariable("a_seq_number")int a_seq_number) {

			return "";
	}
	
	
	@GetMapping("/ask/search")
	public String asksearch(HttpSession session,Model model,String pageNo,String a_category,String query) {
			//dao.askSearchListDao(startNo,endNo,a_category,query)
			model.addAttribute("MaxPageNo","");
			model.addAttribute("askList","");
			return "admin/askBoard";
	}
	
	/*** accuse 신고관리기능 ***/	
	@RequestMapping("/accuse")
	public String accuseboard() {
		return"redirect:accuse/20/1";
	}	
	@RequestMapping("/accuse/{onePageNo}/{pageNo}")
	public String accuseboard( Model model,@PathVariable String onePageNo,@PathVariable String pageNo,String changePageNo) {	
		log.debug("accuseboard 요청"+pageNo+"페이지를"+onePageNo+"개 요청");
		if(changePageNo!=null) {
			if(!changePageNo.equals(onePageNo)) {
			log.debug(changePageNo+"개 표시로 바꿔달라는 request가 있습니다."); 
			return "redirect:/admin/accuse/"+changePageNo+"/"+pageNo;
			}
		}
		List<AccuseDTO> list = dao.accuseListDao(pageNo,onePageNo);
		if(list.size()>0) {
			model.addAttribute("accuseList",list);
			model.addAttribute("pageNo",pageNo);
			model.addAttribute("onePageNo",onePageNo);
		}else {
			log.debug("accuseboard 요청 처리결과 : 값이 없습니다.");
		}
		return "admin/accuseBoard";
	}
	@GetMapping("/accuse/view/{a_seq_number}")
	public String accuseview(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number) {
			AccuseDTO dto = dao.accuseViewDao(a_seq_number);
			model.addAttribute("dto",dto);
			return "admin/accusePage";
	}
	@ResponseBody
	@PutMapping("/accuse/view/{a_seq_number}")
	public int accuseviewPut(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number,String a_complete) {
		int res = dao.accuseUpdateComplete(a_seq_number, a_complete);
		return res; //1성공 0실패
	}
	@GetMapping("/accuse/search")
	public String accusesearch(HttpSession session,Model model,String pageNo,String a_category,String query) {
			//dao.accuseSearchListDao(startNo,endNo,a_category,query)
			model.addAttribute("MaxPageNo","");
			model.addAttribute("accuseList","");
			return "admin/accuseBoard";
	}
	
}
