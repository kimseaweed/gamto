package com.ex.gamto.write;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class WriteService {
	
	
public String saveFile(MultipartFile file) throws Exception {
	String projectPath=System.getProperty("user.dir") + "\\src\\main\\resources\\static\\userUpload\\";
	UUID uuid = UUID.randomUUID();
	String fileName = uuid+"_"+file.getOriginalFilename();
	File savefile = new File(projectPath+fileName);
	file.transferTo(savefile);
	return fileName;
}
}
