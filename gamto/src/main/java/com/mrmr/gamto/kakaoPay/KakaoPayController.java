package com.mrmr.gamto.kakaoPay;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrmr.gamto.kakaoPay.service.KakaoPay;
import com.mrmr.gamto.member.dao.MemberDAO;
import com.mrmr.gamto.store.dao.StoreDAO;
import com.mrmr.gamto.store.dto.OrderTableDTO;

@Controller
public class KakaoPayController {
     
	
	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
	@Autowired
	 private MemberDAO memberDAO;
    @Autowired
    private StoreDAO store;
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
//    @PostMapping("/kakaoPay/kakaoPay")
//    public String kakaoPay(Model model, HttpSession session) {
//        log.info("kakaoPay post............................................");
//        String userId = (String)session.getAttribute("u_id");
//        model.addAttribute("userInfo", dao.orderDetail(u_id));
//        return "/kakaoPay/kakaoPay";
// 
//    }
    
    @RequestMapping(value="/kakaoPay/insertKakaoPayInfo", method = RequestMethod.GET)
    @ResponseBody
    public void insertKakaoPayInfo(@RequestBody OrderTableDTO dto) {
          System.out.println(dto.getO_address());
          System.out.println(dto.getO_book_name());
        store.insertKakaoPayInfo(dto);
          
//        return "<script>location.href='/kakaoPay/kakaoPaySuccessPage?code=""</script>";
    }
    @RequestMapping("/kakaoPay/kakaoPaySuccessPage")
    public String kakaoPaySuccess(Model model, String code) {
     System.out.println("comeback");

    return "/kakaoPay/kakaoPaySuccess";
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