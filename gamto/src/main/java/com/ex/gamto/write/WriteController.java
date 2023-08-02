package com.ex.gamto.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.ex.gamto.report.dto.Book_reportDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/write")
public class WriteController {
	@GetMapping()
	public String getWrite(HttpSession session) {
		return "write/write";
	}
	
	
	@Autowired
	IWriteDAO dao;
	@Autowired
	WriteService service;
	
	@PostMapping("/writeBook_report")
	public String writeAction(MultipartFile filename,Book_reportDTO dto) throws Exception {
		dto.setR_filename(service.saveFile(filename));
		dao.writeBook_report(dto);
		return "redirect:/list";
	}

}
