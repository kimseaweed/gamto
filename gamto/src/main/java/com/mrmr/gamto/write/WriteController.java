package com.mrmr.gamto.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mrmr.gamto.GamtoService;
import com.mrmr.gamto.report.dto.Book_reportDTO;

import jakarta.servlet.http.HttpSession;

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
	public String writeAction(MultipartFile filename,Book_reportDTO dto) throws Exception {
		dto.setR_filename(service.saveFile(filename));
		System.out.println(dto);
		dao.writeBook_report(dto);
		return "redirect:/list";
	}

}
