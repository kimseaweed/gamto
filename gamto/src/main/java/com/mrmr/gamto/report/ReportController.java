package com.mrmr.gamto.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrmr.gamto.freeboard.dto.FreeboardDto;
import com.mrmr.gamto.freeboard.dto.PagingVO;
import com.mrmr.gamto.report.dao.IBook_reportDAO;
import com.mrmr.gamto.report.dto.PageDTO;
import com.mrmr.gamto.report.dto.Book_reportDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/list")
public class ReportController {
	@Autowired
	IBook_reportDAO dao;

	/* 페이징하는 리스트 test */
	@RequestMapping()
	public String boardList(@RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		PageDTO page = new PageDTO(pageNo,10,dao.countBoard());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<Book_reportDTO> list = dao.getPageList(map);
		
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
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "list/writeForm";
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
		
		return "redirect:/list";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		model.addAttribute("updateForm", dao.viewDao(rId));
		
		return "list/updateForm";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		String rTitle = request.getParameter("r_title");		
		String rContent = request.getParameter("r_content");
		String rId = request.getParameter("r_seq_number");
		String rFilename = request.getParameter("r_filename");
	
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("item1", rTitle);
		map.put("item2", rContent);
		map.put("item3", rFilename);
		map.put("item4", rId);
		dao.updateDao(map);

		return "redirect:/list/view?r_seq_number="+rId;
	}
	
	@RequestMapping("/good")
	public String goodCount(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		dao.goodCnt(rId);
		 
		return "redirect:/list/view?r_seq_number="+rId;
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		String rId = request.getParameter("r_seq_number");
		dao.deleteDao(rId);
		return "redirect:/list";
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
		
		List<Book_reportDTO> list = dao.SearchTotal(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "list/list";
	}
}
