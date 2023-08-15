package com.mrmr.gamto.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrmr.gamto.report.dao.IBookReportDAO;
import com.mrmr.gamto.report.dto.BookReportDTO;
import com.mrmr.gamto.report.dto.PageDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/report")
public class ReportController {
	@Autowired
	IBookReportDAO dao;

	/* 페이징하는 리스트 test */
	@RequestMapping()
	public String boardList(@RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		PageDTO page = new PageDTO(pageNo,10,dao.countBoard());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<BookReportDTO> list = dao.getPageList(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "list/list";
	}
	
	@RequestMapping("/view")
	public String freeview(String r_seq_number, Model model) {			  
		 model.addAttribute("dto",dao.viewDao(r_seq_number)); 
		 dao.updateCnt(r_seq_number);
		 
		 System.out.println(dao.viewDao(r_seq_number).getR_recommend());
		return "list/view";
	}
	
	@RequestMapping("/write")
	public String freeWrite(HttpServletRequest request, Model model) {
		String rTitle = request.getParameter("r_title");
		String rName = request.getParameter("r_writer");		
		String rContent = request.getParameter("r_content");
		String rCategory = request.getParameter("r_category");
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", rTitle);
		map.put("item2", rName);
		map.put("item3", rContent);
		map.put("item4", rCategory);
		dao.writeDao(map);
		
		return "redirect:/report";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpSession session, HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		String u_id = (String)session.getAttribute("u_id");
		if(u_id==null||u_id.equals("")) {
			model.addAttribute("error",0);
			return "member/login";
		}else{
			BookReportDTO dto= dao.viewDao(rId); 
			if(u_id.equals(dto.getR_writer())) {				
				model.addAttribute("updateForm", dto);
				model.addAttribute("requestType", "update");
				return "write/write";			
			}else {
			model.addAttribute("script","<script>alert('권한이없습니다.');history.back();</script>");
			return "script";
			}
		}	
	}
	
	/*
	 * @RequestMapping("/update") public String update(HttpSession session,
	 * BookReportDTO dto, Model model) {
	 * System.out.println("아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ : "+dto.getR_filename());
	 * String u_id = (String)session.getAttribute("u_id");
	 * 
	 * if(u_id.equals(dto.getR_writer())) { Map<String,String> map = new
	 * HashMap<String,String>(); dto.setR_filename(service.saveFile(filename));
	 * map.put("item1", dto.getR_title()); map.put("item2", dto.getR_content());
	 * map.put("item3", dto.getR_filename()); map.put("item4",
	 * Integer.toString(dto.getR_seq_number())); dao.updateDao(map);
	 * 
	 * return
	 * "redirect:/report/view?r_seq_number="+Integer.toString(dto.getR_seq_number())
	 * ; }else { model.addAttribute("script",
	 * "<script>alert('권한이없습니다.');history.back();</script>"); return "script"; } }
	 */
	
	@RequestMapping("/good")
	public String goodCount(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		dao.goodCnt(rId);
		 
		return "redirect:/report/view?r_seq_number="+rId;
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		dao.deleteDao(rId);
		return "redirect:/report";
	}
	
	@RequestMapping("/SearchTotal")
	public String SearchTotal(HttpServletRequest request, @RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		
		PageDTO page = new PageDTO(pageNo,10,dao.countBoard());
		String item = request.getParameter("item");
		String text = request.getParameter("text");

		Map<String, String> map = new HashMap<>();
		
		map.put("startNo", Integer.toString(page.getStartNo()));
		map.put("endNo",  Integer.toString(page.getEndNo()));
		map.put("item", item);
		map.put("text", text);
		
		List<BookReportDTO> list = dao.SearchTotal(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "list/list";
	}
}
