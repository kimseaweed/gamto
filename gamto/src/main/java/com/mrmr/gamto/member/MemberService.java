package com.mrmr.gamto.member;

import java.security.Key;
import java.util.Date;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.mrmr.gamto.member.dao.MemberDao;
import com.mrmr.gamto.member.dto.MemberDTO;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.xml.bind.DatatypeConverter;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	@Autowired
	public MemberDao dao;

	private final JavaMailSender javaMailSender;
	private static final String SENDER = "gamt5476@gmail.com";
	private static int number;
	

	// 랜덤숫자 5자리 생성
	private static void createNumber() {
		number = (int) (Math.random() * (90000)) + 10000;
		// 0이상 90000미만의 랜덤수를 생성하여 1000을 더한다
		// 즉 10000이상 99999이하의 숫자가 생성된다
	}
	/** 테스트*/
	/*
	 * public void createMail(MemberDTO memberdto) { SimpleMailMessage message = new
	 * SimpleMailMessage(); message.setTo(memberdto.getU_email());
	 * message.setFrom(sencderEmail); message.setSubject(memberdto.getU_name() +
	 * "님의 회원가입을 진심으로 환영합니다."); message.setText("해당 메일은 테스트 메일입니다. \n감사합니다.");
	 * 
	 * javaMailSender.send(message); }
	 */
	
	// 인증메일 발송
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
				message.setFrom(SENDER);
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
	//JWT시크릿키
	private static final String SECRET_KEY = "ggaammttoo";
	//토큰생성
	public String createToken(String subject, long expTime) {
		if(expTime<=0) {
			throw new RuntimeException("만료시간이 0보다 커야함");
		}
		// 서명알고리즘. 원하는걸로 고르면 됨.
		SignatureAlgorithm algorithm = SignatureAlgorithm.ES512;
		//시크릿키를 64진법으로 변환한다.
		byte[] secretKeyBytes = DatatypeConverter.parseBase64Binary(SECRET_KEY);
		// java Security. 변환된 시크릿키와 알고리즘을 넣어 키를 생성한다.
		Key signingKey = new SecretKeySpec(secretKeyBytes, algorithm.getJcaName());
		
		return Jwts.builder() //JWT생성 빌더
				.setSubject(subject) //주로 아이디로 설정
				.signWith(signingKey, algorithm) //
				.setExpiration( //만료시간 설정
						new Date(System.currentTimeMillis()+expTime)) //현재시간에 만료시간을 더한다.
				//헤더정보,발급자,대상자 등 더 많은 정보와 검증과정을 만들수있다.
				.compact(); // 위 내용을 종합하여 JWT생성하여 리턴
	}
	//토큰 복호화
	public String getSubject(String token) {
		//클레임이란 JWT의 Payload(내용) 부분의 한 조각을 뜻한다. 여러클레임이 들어있을수도 있다.
		Claims claims =  Jwts.parserBuilder() //복호화빌더
				.setSigningKey(DatatypeConverter.parseBase64Binary(SECRET_KEY))
				.build()
				.parseClaimsJws(token)
				.getBody();
		return claims.getSubject();
		 

	}
}
