package com.mrmr.gamto.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mrmr.gamto.admin.dao.AdminDAO;
import com.mrmr.gamto.admin.dto.AdminMemberDTO;
import com.mrmr.gamto.admin.service.AdminService;
import com.mrmr.gamto.help.dto.AccuseDTO;
import com.mrmr.gamto.help.dto.AskDTO;
import com.mrmr.gamto.member.dto.MemberDTO;
import com.mrmr.gamto.member.dto.MyBoardDTO;
import com.mrmr.gamto.store.dto.StoreDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

//@SessionAttribute(name = "userId", required = false)

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	private int onePageNumDefault = 20;

	@Autowired
	AdminDAO dao;
	@Autowired
	AdminService service;

	// admin url 진입
	@RequestMapping("")
	public String inAdmin() {
		return "redirect:/admin/login";
	}

	// 관리자 추가 폼
	@GetMapping("/new")
	public String getAdmin() {
		return "admin/adminJoinForm";
	}

	// 관리자 추가 액션
	@PostMapping("/new")
	public String postAdmin(AdminMemberDTO dto, Model model) {
		dto.setAdmin_password(service.encrypt(dto.getAdmin_password()));
		int result = dao.insertAdminMember(dto);
		if (result != 1) {
			model.addAttribute("alert", "alert('등록되지 않았습니다.');");
		}
		model.addAttribute("alert", "alert('등록이 완료되었습니다.");
		return "redirect:/admin/login";
	}

	// 관리자 로그인 폼
	@GetMapping("/login")
	public String getAdminLogin() {
		return "admin/adminLoginForm";
	}

	// 관리자 로그인 액션
	@PostMapping("/login")
	public String postAdminLogin(String admin_id, String admin_password, HttpSession session,
			HttpServletRequest request, Model model) {
		AdminMemberDTO dto = dao.selectAdminMember("where admin_id = '" + admin_id + "'");
		if (dto == null) {
			model.addAttribute("alert", "alert('존재하지 않는 아이디입니다.')");
		} else if (admin_id.equals(dto.getAdmin_id())) {
			admin_password = service.encrypt(admin_password);
			if (admin_password.equals(dto.getAdmin_password())) {
				session.invalidate();
				HttpSession newsession = request.getSession(true);
				newsession.setAttribute("admin_id", dto.getAdmin_id());
				newsession.setAttribute("admin_name", dto.getAdmin_name());
				newsession.setAttribute("admin_role", dto.getAdmin_role());
				newsession.setAttribute("u_id", "<b>감토지기</b>");
			} else {
				model.addAttribute("alert", "alert('비밀번호가 일치하지 않습니다.');");
			}
		}
		return "admin/adminLoginForm";
	}

	// 관리자 로그아웃
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "admin/adminLoginForm";
	}

	//감토지기 관리 /admin/admin-member"
	@RequestMapping("/admin-member")
	public String adminMember() {
		return "redirect:/admin/admin-member/" + onePageNumDefault + "/1";
	}
	@RequestMapping("/admin-member/{onePageNo}/{pageNo}")
	public String adminMemberList(Model model, @PathVariable String onePageNo, @PathVariable String pageNo,String changePageNo) {
		log.debug("AdminMemberList 요청" + pageNo + "페이지를" + onePageNo + "개 요청");
		if (changePageNo != null) {
			if (!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo + "개 표시로 바꿔달라는 request가 있습니다.");
				return "redirect:/admin/admin-member/" + changePageNo + "/" + pageNo;
			}
		}
		List<AdminMemberDTO> list = dao.adminListDao(pageNo, onePageNo,"");
		if (!list.isEmpty()) {
			model.addAttribute("adminList", list);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("onePageNo", onePageNo);
		} else {
			log.debug("AdminMemberList 요청 처리결과 : 값이 없습니다.");
			model.addAttribute("adminList", null);
		}
		return "admin/adminMemberList";
		
	}
	
	//회원 관리 /admin/member
	@RequestMapping("/member")
	public String Member() {
		return "redirect:/admin/member/" + onePageNumDefault + "/1";
	}
	@RequestMapping("/member/{onePageNo}/{pageNo}")
	public String memberList(Model model, @PathVariable String onePageNo, @PathVariable String pageNo,String changePageNo) {
		log.debug("AdminMemberList 요청" + pageNo + "페이지를" + onePageNo + "개 요청");
		if (changePageNo != null) {
			if (!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo + "개 표시로 바꿔달라는 request가 있습니다.");
				return "redirect:/admin/member/" + changePageNo + "/" + pageNo;
			}
		}
		List<MemberDTO> list = dao.memberListDao(pageNo, onePageNo,"");
		if (!list.isEmpty()) {
			model.addAttribute("memberList", list);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("onePageNo", onePageNo);
		} else {
			log.debug("MemberList 요청 처리결과 : 값이 없습니다.");
			model.addAttribute("memberList", null);
		}
		return "admin/memberList";
		
	}
	
	
	
	

	/*** ask 문의관리기능 ***/
	@RequestMapping("/ask")
	public String askboard() {
		return "redirect:ask/" + onePageNumDefault + "/1";
	}

	@RequestMapping("/ask/{onePageNo}/{pageNo}")
	public String askboard(Model model, @PathVariable String onePageNo, @PathVariable String pageNo,
			String changePageNo) {
		log.debug("askboard 요청" + pageNo + "페이지를" + onePageNo + "개 요청");
		if (changePageNo != null) {
			if (!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo + "개 표시로 바꿔달라는 request가 있습니다.");
				return "redirect:/admin/ask/" + changePageNo + "/" + pageNo;
			}
		}
		List<AskDTO> list = dao.askListDao(pageNo, onePageNo);
		if (!list.isEmpty()) {
			model.addAttribute("askList", list);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("onePageNo", onePageNo);
		} else {
			log.debug("askboard 요청 처리결과 : 값이 없습니다.");
			model.addAttribute("askList", null);
		}
		return "admin/askBoard";
	}

	@GetMapping("/ask/view/{a_seq_number}")
	public String askview(HttpSession session, Model model, @PathVariable("a_seq_number") int a_seq_number) {
		AskDTO dto = dao.askViewDao(a_seq_number);
		model.addAttribute("dto", dto);
		return "admin/askPage";
	}

	@ResponseBody
	@PutMapping("/ask/view/{a_seq_number}")
	public int askviewPut(HttpSession session, Model model, @PathVariable("a_seq_number") int a_seq_number,
			String a_complete) {
		int res = dao.askUpdateComplete(a_seq_number, a_complete);
		return res; // 1성공 0실패
	}

	@GetMapping("/ask/{a_seq_number}/file")
	public String askFile(@PathVariable("a_seq_number") int a_seq_number) {

		return "";
	}

	@GetMapping("/ask/search")
	public String asksearch(HttpSession session, Model model, String pageNo, String a_category, String query) {
		// dao.askSearchListDao(startNo,endNo,a_category,query)
		model.addAttribute("MaxPageNo", "");
		model.addAttribute("askList", "");
		return "admin/askBoard";
	}

	/*** accuse 신고관리기능 ***/
	@RequestMapping("/accuse")
	public String accuseboard() {
		return "redirect:accuse/20/1";
	}

	@RequestMapping("/accuse/{onePageNo}/{pageNo}")
	public String accuseboard(Model model, @PathVariable String onePageNo, @PathVariable String pageNo,
			String changePageNo) {
		log.debug("accuseboard 요청" + pageNo + "페이지를" + onePageNo + "개 요청");
		if (changePageNo != null) {
			if (!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo + "개 표시로 바꿔달라는 request가 있습니다.");
				return "redirect:/admin/accuse/" + changePageNo + "/" + pageNo;
			}
		}
		List<AccuseDTO> list = dao.accuseListDao(pageNo, onePageNo);
		if (list.size() > 0) {
			model.addAttribute("accuseList", list);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("onePageNo", onePageNo);
		} else {
			log.debug("accuseboard 요청 처리결과 : 값이 없습니다.");
		}
		return "admin/accuseBoard";
	}

	@GetMapping("/accuse/view/{a_seq_number}")
	public String accuseview(HttpSession session, Model model, @PathVariable("a_seq_number") int a_seq_number) {
		AccuseDTO dto = dao.accuseViewDao(a_seq_number);
		model.addAttribute("dto", dto);
		return "admin/accusePage";
	}

	@ResponseBody
	@PutMapping("/accuse/view/{a_seq_number}")
	public int accuseviewPut(HttpSession session, Model model, @PathVariable("a_seq_number") int a_seq_number,
			String a_complete) {
		int res = dao.accuseUpdateComplete(a_seq_number, a_complete);
		return res; // 1성공 0실패
	}

	@GetMapping("/accuse/search")
	public String accusesearch(HttpSession session, Model model, String pageNo, String a_category, String query) {
		// dao.accuseSearchListDao(startNo,endNo,a_category,query)
		model.addAttribute("MaxPageNo", "");
		model.addAttribute("accuseList", "");
		return "admin/accuseBoard";
	}
	
	/*** 게시판 관리기능 ***/
	@RequestMapping("/board")
	public String board() {
		return "redirect:/admin/board/20/1";
	}

	@RequestMapping("/board/{onePageNo}/{pageNo}")
	public String boardList(Model model, @PathVariable String onePageNo, @PathVariable String pageNo, String changePageNo) {
		log.debug("board 요청" + pageNo + "페이지를" + onePageNo + "개 요청");
		if (changePageNo != null) {
			if (!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo + "개 표시로 바꿔달라는 request가 있습니다.");
				return "redirect:/admin/board/" + changePageNo + "/" + pageNo;
			}
		}
		List<MyBoardDTO> list = dao.boardListDao(pageNo, onePageNo,"");
		if (list.size() > 0) {
			model.addAttribute("boardList", list);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("onePageNo", onePageNo);
		} else {
			log.debug("boar 요청 처리결과 : 값이 없습니다.");
		}
		return "admin/board";
	}
	
	

	/*** store 상점관리기능 ***/	
	@RequestMapping("/store")
	public String storeboard() {
		return"redirect:store/"+onePageNumDefault+"/1";
	}
	//상점 관리 진입
	@RequestMapping("/store/{onePageNo}/{pageNo}")
	public String storeList( Model model,@PathVariable String onePageNo,@PathVariable String pageNo,String changePageNo) {
		log.debug("storeList 요청"+pageNo+"페이지를"+onePageNo+"개 요청");
		if(changePageNo!=null) {
			if(!changePageNo.equals(onePageNo)) {
				log.debug(changePageNo+"개 표시로 바꿔달라는 request가 있습니다."); 
				return "redirect:/admin/store/"+changePageNo+"/"+pageNo;
				}
		}
		List<StoreDTO> list = dao.storeListDao(pageNo,onePageNo,"");
			if(list.size()>0) {
				model.addAttribute("storeList",list);
				model.addAttribute("pageNo",pageNo);
				model.addAttribute("onePageNo",onePageNo);
			}else {
				model.addAttribute("storeList", null);
				log.debug("storeboard 요청 처리결과 : 값이 없습니다.");
			}
			return "admin/storelist";
	}


	// 상점 등록 진입
	@GetMapping("/store/new")
	public String insertStoreForm() {
		return "admin/storeForm";
	}

	// 상점 등록 액션
	@PostMapping("/store/new")
	public String insertStore(StoreDTO dto, MultipartFile filename, String b_name) throws Exception {
		dto.setB_filename(service.saveFile(filename));
		dao.insertStoreDao(dto);
		log.trace("상품등록완료" + dto.toString());
		return "redirect:/admin/store/list";
	}
	
	
	

}
