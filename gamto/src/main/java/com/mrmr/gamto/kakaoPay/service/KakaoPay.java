package com.mrmr.gamto.kakaoPay.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.mrmr.gamto.kakaoPay.dto.KakaoPayApprovalVO;
import com.mrmr.gamto.kakaoPay.dto.KakaoPayReadyVO;

import lombok.extern.java.Log;
 
@Service
@Log
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    /* 추가한 필드들 3개.  */
    private String partner_order_id;
    private String partner_user_id;
    private String total_amount;
    
    
    
    public String kakaoPayReady(Map<String,String> map) {
    	System.out.println("◎ 4: 카카오페이 서비스 - 카카오페이레디 진입했습니다. 매개값 없었는데 받는걸로 수정했습니다");
    	 this.partner_order_id = map.get("partner_order_id");
    	 this.partner_user_id= map.get("partner_user_id");
    	 this.total_amount= map.get("total_amount");
    	 System.out.println(partner_order_id+"///"+partner_user_id+"///"+total_amount);
    	
    	
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Headerß
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f6fdea9d6fa6ec6554662cdfdfe52d7d"); //이거 우리 api키
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        log.info("02.kakaoPayReady 헤더값이 준비됐습니다");
        
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); //테스트 결제코드. 카카오랑 가맹점 맺어야 받을수있음
        params.add("partner_order_id", partner_order_id);
        params.add("partner_user_id", partner_user_id);
        params.add("item_name", "감토 상점");
        params.add("quantity", "1");
        params.add("total_amount", total_amount);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8089/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8089/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8089/kakaoPaySuccessFail");

        
        System.out.println("◎ 5: 매개값 받은거 여기다 넣을게요. 원본은 복사해서 주석처리");
        /*
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", "갤럭시S9");
        params.add("quantity", "1");
        params.add("total_amount", "2100");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8089/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8089/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8089/kakaoPaySuccessFail");
        */
		        log.info("03.kakaoPayReady 바디값이 준비됐습니다");
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         log.info("04.kakaoPayReady 헤더와 바디를 합쳐 전송할 준비를 마쳤습니다.");
         
        try {
        	 log.info("05.kakaoPayReady 에서 kakaoPayReadyVO값을 담기위해 .restTemplate.postForObject를 실행합니다.");
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            System.out.println("◎ 7:▲ 여기 객체의 필드로 선언된 kakaoPayReadyVO에 값을저장하네요. ▼ 하지만 KakaoPayReadyVO 는 tid, 완료링크,요청날짜정도밖에 없습니다.");
            log.info("06. kakaoPayReady)try) kakaoPayReadyVO에 restTemplate.postForObjec값을 담았습니다 : "  + kakaoPayReadyVO+"여기에 나오는 링크가 큐알코드링크임");
            log.info("07. "+kakaoPayReadyVO.getNext_redirect_pc_url()+"를 리턴합니다");
            log.info("07-1. 여기서 큐알코드가 켜졌습니다");
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
    	log.info("09. 컨트롤러 /kakaoPaySuccess 마지막줄인 KakaoPayInfoVO가 시작됩니다. 여기서부터 서비스 kakaoPayInfo 진입합니다.");
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f6fdea9d6fa6ec6554662cdfdfe52d7d");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        
        System.out.println("◎ 8: 바로 이부분입니다.  원본코드는 주석처리. ");
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); //이값도 받아올수있겠지만 아무도 변형못하게 문자열로 넣는다? 어긋나지 않게 요청된곳에서 가져온다? 뭐가 옳은지 고민을 좀 해봐야겠습니다
        params.add("tid", kakaoPayReadyVO.getTid());
        /* kakaoPayReadyVO는 partner_order_id,partner_user_id, total_amount를 가져올수 없고, kakaoPayApprovalVO는 시작하기전이고.. 
         * dto나 vo가 하나 더 있으면 좋겠네요. 우선은 이 java파일 상단에 필드로 선언했습니다.  
         */
        params.add("partner_order_id", partner_order_id);
        params.add("partner_user_id", partner_user_id);
        params.add("pg_token", pg_token);
        params.add("total_amount",total_amount);
        /*
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        */
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            log.info("09. kakaoPayApprovalVO값을 출력한 뒤 리턴 kakaoPayApprovalVO를 리턴할 차례입니다");
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
}