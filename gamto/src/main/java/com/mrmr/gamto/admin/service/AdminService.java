package com.mrmr.gamto.admin.service;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {
	public String saveFile(MultipartFile file) throws Exception {
		if (file == null) {
			return "";
		}
		String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\img\\book\\";
		String fileName = file.getOriginalFilename();
		//경로와 파일명을 지정하여 파일객체 생성
		File savefile = new File(projectPath + fileName);
		//파일저장
		file.transferTo(savefile);
		//db에 저장할 파일이름 리턴
		log.debug(fileName+"을 저장했습니다.");
		return fileName;
	}
	
}
