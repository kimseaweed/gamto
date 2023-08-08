package com.mrmr.gamto.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrmr.gamto.freeboard.dao.IFreeboardDao;
import com.mrmr.gamto.freeboard.dto.FreeboardDto;
import com.mrmr.gamto.freeboard.dto.PagingVO;

import jakarta.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/board")
public class FreeboardController {
	@Autowired
	IFreeboardDao dao;

	/* 페이징하는 리스트 test */
	@RequestMapping()
	public String boardList(@RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		PagingVO page = new PagingVO(pageNo,10,dao.countBoard());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<FreeboardDto> list = dao.getPageList(map);
		
		model.addAttribute("page",page);
		model.addAttribute("board",list);
		
		return "freeboard/board";
	}
	
	@RequestMapping("/view")
	public String freeview(HttpServletRequest request, Model model) {
		System.out.println("test");
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		dao.updateCnt(fId);
		
		return "freeboard/view";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "freeboard/writeForm";
	}
	
	@RequestMapping("/write")
	public String freeWrite(HttpServletRequest request, Model model) {
		String fTitle = request.getParameter("f_title");
		String fName = request.getParameter("f_writer");		
		String fContent = request.getParameter("f_content");
		String fCategory = request.getParameter("f_category");
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fTitle);
		map.put("item2", fName);
		map.put("item3", fContent);
		map.put("item4", fCategory);
		dao.writeDao(map);
		
		return "redirect:/board";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		model.addAttribute("updateForm", dao.viewDao(fId));
		
		return "freeboard/updateForm";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		System.out.println("test222");
		String fTitle = request.getParameter("f_title");		
		String fContent = request.getParameter("f_content");
		String fId = request.getParameter("f_seq_number");
		String fCategory = request.getParameter("f_category");
	
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("item1", fTitle);
		map.put("item2", fContent);
		map.put("item3", fCategory);
		map.put("item4", fId);
		dao.updateDao(map);

		return "redirect:/board/view?f_seq_number="+fId;
	}
	
	@RequestMapping("/good")
	public String goodCount(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		dao.goodCnt(fId);
		 
		return "redirect:/board/view?f_seq_number="+fId;
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
		model.addAttribute("cDto",dao.cListDao(fId));
		
		return "freeboard/viewComment";
	}
	
	@RequestMapping("/insertCommend")
	public String insertCommend(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String fName = request.getParameter("f_writer");	
		model.addAttribute("dto",dao.viewDao(fId));
		model.addAttribute("cDto",dao.cListDao(fId));		
			
		String fContent = request.getParameter("c_content");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("item1", fId);
		map.put("item2", fName);
		map.put("item3", fContent);
		dao.cWriteDao(map);
		
		return "redirect:/board/viewComment?f_seq_number="+fId;
	}
	
	@RequestMapping("/cGoodCnt")
	public String commentGoodButton(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cGoodCnt(cId);
		 
		return "redirect:/board/viewComment?f_seq_number="+fId;	
	}
	
	@RequestMapping("/cBadCnt")
	public String commentBadButton(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cBadCnt(cId);
		 
		return "redirect:/board/viewComment?f_seq_number="+fId;	
	}
	
	
	@RequestMapping("/cUpdateForm")
	public String commentUpdateForm(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		model.addAttribute("dto", dao.viewDao(fId));
		model.addAttribute("cDto",dao.cViewDao(cId));
		
		return "freeboard/commentUpdateForm";
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
		
		return "redirect:/board/viewComment?f_seq_number="+fId;
	}
	
	@RequestMapping("/cDelete")
	public String commentDelete(HttpServletRequest request, Model model) {
		String fId = request.getParameter("f_seq_number");
		String cId = request.getParameter("c_seq_number");
		dao.cDeleteDao(cId);
		
		return "redirect:/board/viewComment?f_seq_number="+fId;
	}
	
	@RequestMapping("/SearchCategory")
	public String SearchCategory(HttpServletRequest request, @RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		
		PagingVO page = new PagingVO(pageNo,10,dao.countBoard());
		String fCategory = request.getParameter("f_category");
		
		Map<String, String> map = new HashMap<>();
		
		map.put("startNo", Integer.toString(page.getStartNo()));
		map.put("endNo",  Integer.toString(page.getEndNo()));
		map.put("category", fCategory);
		List<FreeboardDto> list = dao.SearchCategory(map);
		
		model.addAttribute("page",page);
		model.addAttribute("board",list);
		
		return "freeboard/board";
	}
	
	@RequestMapping("/SearchTotal")
	public String SearchTotal(HttpServletRequest request, @RequestParam(required=false, defaultValue="1")
				int pageNo, Model model) {
		
		PagingVO page = new PagingVO(pageNo,10,dao.countBoard());
		String item = request.getParameter("item");
		String text = request.getParameter("text");

		Map<String, String> map = new HashMap<>();
		
		map.put("startNo", Integer.toString(page.getStartNo()));
		map.put("endNo",  Integer.toString(page.getEndNo()));
		map.put("item", item);
		map.put("text", text);
		
		List<FreeboardDto> list = dao.SearchTotal(map);
		
		model.addAttribute("page",page);
		model.addAttribute("board",list);
		
		return "freeboard/board";
	}
}