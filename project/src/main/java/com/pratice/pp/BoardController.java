package com.pratice.pp;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import board.BoardPage;
import board.BoardServiceImple;
import board.BoardVO;
import common.CommonService;
import member.MemberVO;
import product.ProductPage;

@Controller
public class BoardController {
	
	@Autowired private CommonService common;
	@Autowired private BoardServiceImple service;
	@Autowired private BoardPage page;
	
	//관리자가 쓴 답글 저장
	@RequestMapping("/replyinsert.bo")
	public String replyinsert(BoardVO vo, HttpSession session) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginInfo");
		
		vo.setM_id(membervo.getM_id());
		vo.setM_name(membervo.getM_name());
		service.board_reply_insert(vo);
		
		return "redirect:list.bo";
	}
	
	
	//관리자 답글쓰기
	@RequestMapping("/adminreplywrite.bo")
	public String adminreplywrite(int b_id, Model model) {
			model.addAttribute("board", service.board_detail(b_id));
			model.addAttribute("crlf", "\r\n");
		return "admin/adminreplywrite";
	}
	
	@RequestMapping("/board_update.bo")
	public String update(BoardVO vo, MultipartFile file, HttpSession session) {
		
		BoardVO board = service.board_detail(vo.getB_id());
		String uuid = session.getServletContext().getRealPath("resources") + board.getFilepath();
		
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("board", file, session));
			
			
			if( board.getFilename() != null) {
				File f = new File(uuid);
				if( f.exists() ) {f.delete(); }
			}
		}else {
			if(vo.getFilename().isEmpty()) {
				if(board.getFilename() != null) {
					File f = new File(uuid);
					if( f.exists() ) {f.delete();}
				}
			}else {
				vo.setFilename(board.getFilename());
				vo.setFilepath(board.getFilepath());
			}
		}
		
		service.board_update(vo);
		
	return "redirect:/detail.bo?b_id=" + vo.getB_id();
	}
	
	@RequestMapping("/modify.bo")
	public String modfiy(int b_id, Model model) {
		model.addAttribute("board", service.board_detail(b_id));
		model.addAttribute("crlf", "\r\n");
		return "board/modfiy";
	}
	
	@ResponseBody @RequestMapping("/download.bo")
	public void download(int b_id, HttpSession session, HttpServletResponse response) {
		BoardVO vo = service.board_detail(b_id);
		common.download(vo.getFilename(), vo.getFilepath(), session, response);
	}
	
	@RequestMapping("/detail.bo")
	public String board_detail(int b_id, Model model) {
		BoardVO board = service.board_detail(b_id);
		 
		
		model.addAttribute("board", board);
		model.addAttribute("board_reply", board);
	
		model.addAttribute("crlf", "\r\n");
		
		
		return"board/detail";
	}
	
	@RequestMapping("/board_insert.bo")
	public String board_insert(MultipartFile file, BoardVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("loginInfo");
		
		if( !file.isEmpty() ) {
			vo.setFilepath(common.upload("board", file, session));
			vo.setFilename(file.getOriginalFilename());
		}
		
		
		vo.setM_name( mvo.getM_name() );
		vo.setM_id( mvo.getM_id() );
		
		service.board_insert(vo);
		return "redirect:/list.bo";
	}
	
	
	@RequestMapping("/write.bo")
	public String WriteBoard() {
		
		return"board/write";
	}
 
	@RequestMapping("/list.bo")
	public String BoardList(String keyword, String search, Model model, @RequestParam(defaultValue = "1") int curPage, HttpSession session) {
		session.setAttribute("category", "bo");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.board_list(page));
		
	
		
		return "board/list";
	}
}
