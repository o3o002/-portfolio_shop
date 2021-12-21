package com.pratice.pp;

import java.awt.PageAttributes.MediaType;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import product.ProductServiceImpl;
import review.ReviewServiceImple;
import review.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired ProductServiceImpl product;
	@Autowired CommonService common;
	@Autowired ReviewServiceImple service;
	
	@RequestMapping("/reply_insert.rv")
	public String reply_review_insert(ReviewVO vo, HttpServletRequest request) {
		service.reivew_reply(vo);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("/insert.rv")
	public String review_insert(MultipartFile file, ReviewVO vo, HttpSession session) {
		
		if( !file.isEmpty() ) {
			vo.setFilepath(common.upload("review", file, session));
		}
		
		vo.setM_id("test123");
		service.review_insert(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping("/write.rv")
	public String review_write(HttpSession session, Model model, int p_num ) {
		model.addAttribute("product", product.product_detail(p_num));
		return "review/write";
	}
}
