package com.ex.gamto.write;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ex.gamto.freeboard.dto.FreeboardDto;
import com.ex.gamto.report.dto.Book_reportDTO;

@Controller
@RequestMapping("/write")
public class WriteController {
	@GetMapping()
	public String getWrite(/*세션*/) {
		/*세션이 비었다면 알럿띄우고 로그인연결*/
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
	@PostMapping("/writeFree_board")
	public String writeAction(MultipartFile filename,FreeboardDto dto) throws Exception {
		dto.setF_filename(service.saveFile(filename));
		dao.writeFree_board(dto);
		return "redirect:/board";
	}
	

}
