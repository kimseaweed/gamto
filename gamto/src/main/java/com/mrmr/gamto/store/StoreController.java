package com.mrmr.gamto.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.store.dao.StoreDAO;

import jakarta.servlet.http.HttpServletRequest;

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
		dao.deleteDao(request.getParameter("id"));
		
		return "redirect:b_list";
	}
	
	@RequestMapping("/cart") //장바구니 목록 
	public String cart(Model model, HttpServletRequest request) {
		model.addAttribute("cart", dao.cartDao());
		return "store/cart";
	}
	
	@RequestMapping("/addCart") // 장바구니 담기 
	public String addCart(Model model, HttpServletRequest request) {
		dao.addCartDao(request.getParameter("b_code"));
		return "store/b_list";
	}
}