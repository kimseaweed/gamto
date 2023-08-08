package com.mrmr.gamto.member;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/member")
public class MemberFindpwController {

	@Autowired
	MemberService service;
	
	//비밀번호찾기 : 페이지이동
	@GetMapping("/reset-pw")
	public String resetPwPage() {
		System.out.println();
		return "member/resetPw";
	}
	//비밀번호찾기 : 아이디,메일확인
	/*
	 * @PostMapping("/mail") public String resetPw(String id, String email) { return
	 * Integer.toString(service.resetPwMail(id,email)); }
	 */
	@GetMapping("/token/create")
	public Map<String, Object> createToken(@RequestParam(value="subject") String subject){
		//json으로 데이터를 받기위해 oject로 설정, post방식으로 보내서 속성을 얻어오는것이 정석..
		String token = service.createToken(subject, (1000*60*2)); //밀리초*60초*분
		Map<String, Object> map=new LinkedHashMap<>();
		map.put("result", token);
		return map;
	}
	@GetMapping("/token/subject")
	public Map<String, Object> subjectToken(@RequestParam(value="token") String token){
		String subject = service.getSubject(token);
		Map<String, Object> map=new LinkedHashMap<>();
		map.put("result", token);
		return map;
	}
}
