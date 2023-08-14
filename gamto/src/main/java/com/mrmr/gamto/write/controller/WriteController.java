package com.mrmr.gamto.write.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mrmr.gamto.report.dto.BookReportDTO;
import com.mrmr.gamto.utils.GamtoService;
import com.mrmr.gamto.write.DAO.IWriteDAO;
import com.mrmr.gamto.write.service.WriteService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/write")
public class WriteController {

	@Autowired
	IWriteDAO dao;
	@Autowired
	WriteService service;

	
	@RequestMapping()
	public String getWrite(HttpSession session,Model model) {
		return GamtoService.needLogin(session, model,"/write","write/write");
	}
	
	@PostMapping("/writeBook_report")
	public String writeAction(MultipartFile filename,BookReportDTO dto,String footer) throws Exception {
		dto.setR_content(dto.getR_content()+footer);
		dto.setR_filename(service.saveFile(filename));
		dao.writeBookReport(dto);
		return "redirect:/report";
	}
	
	
	@RequestMapping("/test")
	public String getWritddde() {
		return "write/testpage";
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
	
}
