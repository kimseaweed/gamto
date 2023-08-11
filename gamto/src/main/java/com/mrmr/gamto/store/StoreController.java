package com.mrmr.gamto.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrmr.gamto.store.dao.StoreDAO;
import com.mrmr.gamto.store.dto.CartDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/b_list")
public class StoreController {
	@Autowired
	StoreDAO dao;
	
	@RequestMapping()
	public String userStroePage(Model model) {
		model.addAttribute("b_list", dao.listDao());
		return "store/b_list";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		String s_code = request.getParameter("b_code");
		model.addAttribute("dto", dao.viewDao(s_code));
		return "store/view";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, HttpServletRequest request) {
		dao.deleteDao(request.getParameter(""));
		
		return "redirect:b_list";
	}
	
	@RequestMapping("/cart") //장바구니 목록 
	public String cart(Model model, HttpServletRequest request, HttpSession session) {
		String getId =(String)session.getAttribute("u_id");
		if(getId == null) {
			System.out.println("실패했어  다시 해 ");
			return "/member/login";
		} else {
			List<CartDTO> dto = dao.cartDao(getId);
			model.addAttribute("cart", dto);
			return "store/cart";
		}
		
	}
	
	@PostMapping("/addCart") // 장바구니 담기 
	@ResponseBody
	public int addCart(String b_code, String b_quantity,  HttpSession session) {
		String getId =(String)session.getAttribute("u_id");
		System.out.println(b_code + b_quantity + getId);
		if(getId == null) {
			System.out.println("실패했어  다시 해 ");
			return -1;
		} else {
			int result = dao.addCartDao(getId, b_code, b_quantity);
			return result;
		}
	}
	
	@RequestMapping("/removeCart") //장바구니 목록 삭제  
	public String removeCart(Model model, String b_code, HttpSession session) {
		String getId =(String)session.getAttribute("u_id");
		dao.removeCartDao(getId, b_code);
		return "redirect:/b_list/cart";
	}
	
	@RequestMapping("/removeAllCart") //장바구니 목록 전체 삭제 
	public String removeAllCartDao(Model model, HttpServletRequest request, HttpSession session) {
		String getId =(String)session.getAttribute("u_id");
		dao.removeAllCartDao(getId);
		return "store/cart";
	}
	
	@RequestMapping("/header")
	@ResponseBody
	public int listNum(HttpSession session) {
		String getId =(String)session.getAttribute("u_id");
		if(getId == null) {
			System.out.println("실패했어  다시 해 ");
			return 0;
		} else {
			int result = dao.listNumDao(getId);
			return result;
		}
	}
	
	@RequestMapping("/purchaseList")//구매내역
	public String purchaseListDao(Model model) {
		model.addAttribute("list", dao.purchaseListDao());
		return "store/purchaseList";
	}
}