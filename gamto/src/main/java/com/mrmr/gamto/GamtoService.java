package com.mrmr.gamto;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

public class GamtoService {
	
	/** 로그인이 필요한 페이지에  사용합니다
	*로그인 안되어있으면 로그인페이지로,<br> 로그인되어있으면 입력한 view로 이동 및 모델에 u_id 셋팅<br><br>
	*@param session : 로그인아이디를 확인하는데 씁니다
	*@param model : 로그인되있으면 아이디를 전달하기위해, 로그인안되어있으면 alert 스크립트를 띄우고 로그인후 url 재요청을 위해 씁니다
	*@param url : 로그인후 다시요청할 url를 넣어주세요
	*@param view : 로그인이 되어있다면 표시할 뷰를 선택해주세요<br><br>
	*@return 컨트롤러의 리턴부분에 바로 사용할수있도록 뷰값을 리턴합니다.<br><br>
	*예시-> "/write" 요청시 "write/write"를 리턴하는 매핑이였다면 <br>
	*return GamtoService.needLogin(session, model, "/write", "write/write");<br>
	*결과1 => 로그인 안되어있으면 alert 띄운후 로그인페이지로 이동시키고, 로그인하면 /write로 이동시킨다. ${u_id}가 셋팅되어있으므로 바로 사용할수있다.<br>
	*결과2 => 로그인 되어있으면 매개변수로 지정한 view로 이동한다. ${u_id}가 셋팅되어있으므로 바로사용할수있다.<br><br>
	*@author 민지*/	
	public static String needLogin(HttpSession session,Model model,String url,String view) {
		String u_id = (String) session.getAttribute("u_id");
		if(u_id==null) {
			String script= 
					"<script>"
					+ "alert('로그인이 필요한 서비스입니다');"
					+ "location='/member/login?connect="+url+"';"
					+ "</script>";
			model.addAttribute("script",script);		
			return "script";
		}else {
			model.addAttribute("u_id",u_id);
			return view;
		}
	}
	
	/** 로그인 되어있지 않아야 하는 페이지에 사용합니다<br>
	 * 로그인 되어있으면 이미 로그인 되어있다고 alert 띄운후 뒤로 돌아갑니다<br>
	 * 로그인 되어있지 않다면 원래 리턴해야 하는 값으로 진행됩니다<br><br>
	 * @param session : 로그인 되어있는지 확인하기 위해 사용됩니다
	 * @param model : 로그인 되어있는 경우 스크립트를 띄우고 뒤로가기 위해 사용됩니다
	 * @param returnValue : 로그인 되어있지 않은게 맞다면 디른작업 없이 해당값을 리턴합니다.<br><br>
	 * @author 민지
	 * */
	public static String noneLogin(HttpSession session,Model model,String returnValue) {
		String u_id = (String) session.getAttribute("u_id");
		if(u_id!=null) {
			String script= 
					"<script>"
					+ "alert('이미 로그인 되어있습니다.');"
					+ "hitory.back();"
					+ "</script>";
			model.addAttribute("script",script);		
			return "script";
		}else {
			return returnValue;
		}
	}
}
