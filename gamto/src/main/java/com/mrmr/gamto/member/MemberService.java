package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.mrmr.gamto.member.dao.MemberDao;
import com.mrmr.gamto.member.dto.MemberDTO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final JavaMailSender javaMailSender;
	private static final String sencderEmail = "gamt5476@gmail.com";
	private static int number;
	@Autowired
	public MemberDao dao;

	// 랜덤숫자 5자리 생성
	private static void createNumber() {
		number = (int) (Math.random() * (90000)) + 10000;
		// 0이상 90000미만의 랜덤수를 생성하여 1000을 더한다
		// 즉 10000이상 99999이하의 숫자가 생성된다
	}

	public void createMail(MemberDTO memberdto) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(memberdto.getU_email());
		message.setFrom(sencderEmail);
		message.setSubject(memberdto.getU_name() + "님의 회원가입을 진심으로 환영합니다.");
		message.setText("해당 메일은 테스트 메일입니다. \n감사합니다.");

		javaMailSender.send(message);
	}

	public int resetPwMail(String id,String email) {
		MemberDTO  memberdto = dao.readMemberDao(id);
		if(memberdto==null) {
			return 2;
		}else if(!memberdto.getU_email().equals(email)){
			return 1;
		}else {
			createNumber();
			MimeMessage message = javaMailSender.createMimeMessage();
			try {
				message.setFrom(sencderEmail);
				message.setRecipients(MimeMessage.RecipientType.TO, memberdto.getU_email());
				message.setSubject("[감토] 비밀번호 재설정 인증빈호");
				String body = "<p><b>" + memberdto.getU_name() + "</b>님의 비밀번호를 재설정 하기 위한 인증번호를 안내해드립니다. </p>"
						+ "<div style=\"border:1px solid gray; padding: 10px 20px;\"><h1>" + number + "</h1></div>"
						+ "<p>인증번호를 입력하시면 비밀전호 재설정을 진행합니다. <br> 해당 메일은 ㅇㅇ분 후 만료됩니다.</p>";
				message.setText(body, "utf-8", "html");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			javaMailSender.send(message);
			
			return number;
		}
	}

	
}
