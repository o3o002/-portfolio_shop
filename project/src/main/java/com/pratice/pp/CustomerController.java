package com.pratice.pp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonService;
import cutomer.CustomerSerivceImp;
import member.MemberServiceImpl;

@Controller
public class CustomerController {
	
	@Autowired private CustomerSerivceImp service;
	@Autowired private CommonService common;
	
	@RequestMapping("/list.cu")
	public String customerlist(Model model) {
		model.addAttribute("vo", service.cusotmer_list()); 
		return"";
	}
}
