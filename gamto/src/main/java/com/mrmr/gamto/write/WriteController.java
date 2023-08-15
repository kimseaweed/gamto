package com.mrmr.gamto.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mrmr.gamto.report.dto.BookReportDTO;
import com.mrmr.gamto.utils.GamtoService;
import com.mrmr.gamto.write.dao.IWriteDAO;
import com.mrmr.gamto.write.service.WriteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WriteController {

	@Autowired
	IWriteDAO dao;
	@Autowired
	WriteService service;

	
	@RequestMapping("/report/new")
	public String writeForm(HttpSession session,HttpServletRequest request,Model model) {
		return GamtoService.needLogin(session, model,"/report/new","write/write");
	}
	
	@PostMapping("/report")
	public String create(MultipartFile filename,BookReportDTO dto) throws Exception {
		dto.setR_filename(service.saveFile(filename));
		dao.writeBookReport(dto);
		return "redirect:/report";
	}
	
	@PutMapping("/report/{r_seq_number}")
	public String update(String showImg,MultipartFile filename,BookReportDTO dto) throws Exception {
		if(showImg.equals(dto.getR_filename())){ //삭제x 업로드x
			if(filename==null) {
			}else {
				dto.getR_filename();//삭제작업
				dto.setR_filename(service.saveFile(filename));
			}
		}else { //업로드x
			if(dto.getR_filename().substring(0, 6).equals("default")) { 
				dto.setR_filename(service.saveFile(null)); //삭제는 없어도되지만 랜덤이미지 
			}else {
				
			}
		}	
		
		dao.writeBookReport(dto);
		return "redirect:/report/view?r_seq_number="+dto.getR_seq_number();			
		//상황1 : 기존에 있다가 안바꿨다 - get o, m x 
		//상황2 : 기존에 있다가 새로운걸로 바꿨다 get o, m o,
		//상황3 : 기존에 있다가 기본이미지 하고싶다 get o, m x
		//상황4 : 기존에 없었는데 새로 등록했다  get 디폴트, m o,
		//상황5 : 기존에 없었는데 여전히 없다  get 디폴트, m  x,
		//상황6 : 기존에 없었는데 기본이미지 하고싶다 
		/*
		 * dao.writeBookReport(dto); return "redirect:/report";
		 */
	}

	
}
