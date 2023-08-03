package com.mrmr.gamto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	@GetMapping("/test")
	public String thymeleaf() {
		System.out.println("경로인식");
		return "leaf/sample/sample";
	}

}
