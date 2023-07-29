package com.ex.gamto.write;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriteController {
	@RequestMapping("/write")
	public String write() {

		return "write";
	}
}
