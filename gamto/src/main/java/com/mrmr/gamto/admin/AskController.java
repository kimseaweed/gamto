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

import com.mrmr.gamto.admin.dao.AskDAO;
import com.mrmr.gamto.admin.dto.AskDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/ask")
public class AskController {

	@Autowired
	AskDAO dao;
	
	@RequestMapping(value={"","/{pageNo}"})
	public String askboard(Model model,@PathVariable(required = false)String pageNo) {
			log.debug("askboard 요청");
			int pageNoInt= (pageNo==null)? 1 :Integer.parseInt(pageNo);
			List<AskDTO> list = dao.askListDao(pageNoInt);
			if(list.size()>0) {
				model.addAttribute("askList",list);
				model.addAttribute("pageNo",pageNoInt);
				log.debug(list.size()+"건의 askboard 결과 리턴");		
			}else {
				log.debug("askboard 요청 처리결과 : 값이 없습니다.");
			}
			return "admin/askBoard";
	}
	@GetMapping("/view/{a_seq_number}")
	public String askview(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number) {
			AskDTO dto = dao.askViewDao(a_seq_number);
			model.addAttribute("askView",dto);
			return "admin/askPage";
	}
	@ResponseBody
	@PutMapping("/view/{a_seq_number}")
	public int askviewPut(HttpSession session,Model model,@PathVariable("a_seq_number")int a_seq_number,String a_complete) {
		int res = dao.askUpdateComplete(a_seq_number, a_complete);
		return res; //1성공 0실패
	}
	@GetMapping("/search")
	public String asksearch(HttpSession session,Model model,String pageNo,String a_category,String query) {
			//dao.askSearchListDao(startNo,endNo,a_category,query)
			model.addAttribute("MaxPageNo","");
			model.addAttribute("askList","");
			return "admin/askBoard";
	}
	
	
	
}
