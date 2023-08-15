package com.mrmr.gamto.write.service;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WriteService {
	
	
public String saveFile(MultipartFile file) throws Exception {
	if(file.getOriginalFilename().equals("")||file==null) {return "default"+( (int)(Math.random()*5)+1)+".png";}
	String projectPath=System.getProperty("user.dir") + "\\src\\main\\resources\\static\\userUpload\\";
	UUID uuid = UUID.randomUUID();
	String fileName = uuid+"_"+file.getOriginalFilename();
	File savefile = new File(projectPath+fileName);
	file.transferTo(savefile);
	return fileName;
}

public void deleteFile(String oldfilename) throws Exception {
	String projectPath=System.getProperty("user.dir") + "\\src\\main\\resources\\static\\userUpload\\";
	
	File deleteFile = new File(projectPath+oldfilename);
	if(deleteFile.exists()) {
		deleteFile.delete();
		log.info("파일 삭제 완료");
	}else {
		log.error("deleteFile 에러. 파일이없습니다");
	}

}
}
