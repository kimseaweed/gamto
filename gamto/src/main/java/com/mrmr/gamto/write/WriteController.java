package com.mrmr.gamto.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mrmr.gamto.GamtoService;
import com.mrmr.gamto.report.dto.BookReportDTO;
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
		return "redirect:/list";
	}
	
	
	@RequestMapping("/test")
	public String getWritddde() {
		return "write/testpage";

	}
}
