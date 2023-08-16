package com.mrmr.gamto.kakaoPay;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrmr.gamto.kakaoPay.service.KakaoPay;

import jakarta.servlet.http.HttpSession;

@Controller
public class KakaoPayController {

	
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        //◎ 이건 겟요청이라 쓸일 없을듯?
    }
     
    @PostMapping("/kakaoPay")
    public String kakaoPay(HttpSession session,String total_amount) {
        log.info("kakaoPay post............................................");
        
        
        System.out.println("◎ 1: 시작, /kakaoPay 요청을 통해 받은 합계 : "+total_amount+"/ 세션아이디 : "+(String)session.getAttribute("u_id"));
        /* 지금은 임시로 페이지에 표시되는 숫자를 뜯어왔지만 
         * 이 정보를 가지고 여기서 우리가 만든(이제만들어야함)서비스로 연결시켜서 
         * DB의 cart테이블 과 요청된 정보가 일치하는지 확인하고 일치-> 결제진행, 불일치-> 잘못된요청입니다.다시해주세요 가 필요할듯.
         * 자바스크립트는 오류가 나기도 하고 유저가 수정할수있으니까요. */
        
        Map<String,String> map = new HashMap<>();
        map.put("partner_order_id", "1234"); //결제번호
        //▲ dao.가장 마지막 결제번호 가져오는 쿼리문() 을 만들어서 "결제번호"대신 넣으면 되겠습니다. 
        
        map.put("partner_user_id", (String)session.getAttribute("u_id")); //유저아이디
        //map.put("quantity", "총수량"); //지금은 1개로 고정셋팅 되어있지만 만약 이것도 추가한다면 종류상관없이 총 몇개상품인지 넣으면 좋겠습니다
        map.put("total_amount", total_amount);
        //지금은 홈페이지에서 연산된 결과를 뜯어왔지만 이부분도 dao.cartsum()을 만들어서 가져온 정보와(상용자가 본 숫자)와 우리db의 합계를 비교하고 결제진행or오류발생 필요할듯... 
        
        System.out.println("◎ 3: ▲여기서 만들어가지고 ▼여기다 넣었습니다 ");
        return "redirect:" + kakaopay.kakaoPayReady(map); //qr페이지
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	log.info("08.컨트롤러의 /kakaoPaySuccess요청이 시작됩니다.");
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token)); //kakaoPayApprovalVO return
        System.out.println("끝입니다. 07-1나오고 결제하면 바로 끝나버림");
        return "kakaoPay/kakaoPaySuccess";
    }

    
    //// 테스트 임시페이지 
    @RequestMapping("/kakaoPayCancel")
    public String kakaoPayCancel(Model model) {
        model.addAttribute("script", "결제가 <b>취소</b>되었습니다.<br> 다시 시도해주세요. <br> <a href=\"/store/cart\" class=\"btn btn-success\"> 상점으로 돌아가기 </a>");
    	return "script";
    }
    @RequestMapping("/kakaoPaySuccessFail")
    public String kakaoPaySuccessFail(Model model) {
    	model.addAttribute("script", "결제가 <b>실패</b>되었습니다.<br> 다시 시도해주세요. <br> <a href=\\\"/store/cart\\\" class=\\\"btn btn-success\\\"> 상점으로 돌아가기 </a>");
    	return "script";
    }
}