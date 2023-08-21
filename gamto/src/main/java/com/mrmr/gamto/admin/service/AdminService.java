package com.mrmr.gamto.admin.service;

import java.io.File;
import java.security.MessageDigest;
import java.util.Base64;

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

	
	//(new SHA().Encrypt("my password"));
	private static final String SECRET_KEY = "yougottabekiddingkiddingyesahyehahyeh";
	//sha256 암호화
    public String encrypt(String text) {
        String encryptedText = "";
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            String dataWithSaltAndKey = text + SECRET_KEY;
            messageDigest.update(dataWithSaltAndKey.getBytes("UTF-8"));
            encryptedText = new String(Base64.getEncoder().encode(messageDigest.digest()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return encryptedText;
    }
}
