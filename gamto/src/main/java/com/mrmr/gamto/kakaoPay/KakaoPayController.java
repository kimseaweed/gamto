package com.mrmr.gamto.kakaoPay;


import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.kakaoPay.service.KakaoPay;
import com.mrmr.gamto.member.dao.MemberDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class KakaoPayController {
     
	
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
	@Autowired
    private MemberDAO memberDAO;
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(Model model, HttpSession session) {
        log.info("kakaoPay post............................................");
        String userId = (String)session.getAttribute("u_id");
        model.addAttribute("userInfo", memberDAO.readMemberDao(userId));
        return "kakaoPay/kakaoPay";
 
    }
    
    @RequestMapping("/kakaoPay/kakaoPaySuccess")
    public String kakaoPaySuccess(Model model, String merchant_uid) {
    	
    	System.out.println(merchant_uid);
    	
        return "kakaoPay/kakaoPaySuccess";
    }
    @RequestMapping("/kakaoPay/kakaoPayCancel")
    public String kakaoPayCancel(Model model) {
        model.addAttribute("script", "결제가 <b>취소</b>되었습니다.<br> 다시 시도해주세요. <br> <a href=\"/store/cart\" class=\"btn btn-success\"> 장바구니로 돌아가기 </a>");
       return "script";
    }
    @RequestMapping("/kakaoPay/kakaoPaySuccessFail")
    public String kakaoPaySuccessFail(Model model) {
       model.addAttribute("script", "결제가 <b>실패</b>되었습니다.<br> 다시 시도해주세요. <br> <a href=\"/store/cart\" class=\"btn btn-success\"> 장바구니로 돌아가기 </a>");
       return "script";
    }
}