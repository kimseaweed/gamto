package com.ex.gamto.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ex.gamto.freeboard.dto.FreeboardDto;
import com.ex.gamto.report.dto.Book_reportDTO;

@Controller
@RequestMapping("/write")
public class WriteController {
	@GetMapping()
	public String getWrite(/*세션*/) {
		/*세션이 비었다면 로그인연결*/
		return "write";
	}
	
	
	/*글 작성*/
	@Autowired
	IWriteDAO dao;
	@PostMapping("/writeBook_report")
	public String writeAction(Book_reportDTO dto) {
		System.out.println(dto.toString()); //테스트용.삭제예정
//		dao.writeBook_report(dto); 파일첨부수정후 테스트예정
		return "redirect:/list";
	}
	@PostMapping("/writeFree_board")
	public String writeAction(FreeboardDto dto) {
		System.out.println(dto.toString()); //테스트용.삭제예정
//		dao.writeFree_board(dto); 파일첨부수정후 테스트예정
		return "redirect:/board";
	}

}
