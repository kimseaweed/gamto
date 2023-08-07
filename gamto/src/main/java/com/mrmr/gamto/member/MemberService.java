package com.mrmr.gamto.member;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.mrmr.gamto.member.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final JavaMailSender javaMailSender;
	private static final String sencderEmail = "gamt5476@gmail.com";
	
	public void createMail(MemberDTO memberdto) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(memberdto.getU_email());
		message.setFrom(sencderEmail);
		message.setSubject(memberdto.getU_name()+"님의 회원가입을 진심으로 환영합니다.");
		message.setText("해당 메일은 테스트 메일입니다. \n감사합니다.");
		
		javaMailSender.send(message);
	}
}
