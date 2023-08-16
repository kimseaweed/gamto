package com.mrmr.gamto.kakaoPay;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrmr.gamto.kakaoPay.dao.KakaoPayDAO;
import com.mrmr.gamto.kakaoPay.service.KakaoPay;

@Controller
public class KakaoPayController {
    @Autowired
    KakaoPayDAO dao;
	
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token)); //kakaoPayApprovalVO return
    }
    
    @GetMapping("/kakaoPay")
    public String setKakaoPay(Model model) {
    	model.addAttribute("kakaopay", dao.setKakaoPay());
    	System.out.println(model.toString());
    	return null;
    }
    
}