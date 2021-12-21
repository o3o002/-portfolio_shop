package com.pratice.pp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import order.DeliverVO;
import order.OrderServiceImpl;
import order.OrderdetailVO;
import productbuy.ProductBasketVO;
import productbuy.ProductBuyServiceImpl;

@Controller
public class OrderCOntroller {
	@Autowired OrderServiceImpl service;
	@Autowired ProductBuyServiceImpl buy;
	
	@RequestMapping("/orderlist.od")
	public String order_list(HttpSession session, Model model) {
	MemberVO member = (MemberVO)session.getAttribute("loginInfo");
	model.addAttribute("list", service.my_order_list(member.getM_id()));
		return "order/list";
	}
	
	@RequestMapping("/cancle.od")
	public String order_cancel(String order_num) {
		service.my_order_cancel(order_num);
		return "redirect:/";
	}
	
	@ResponseBody @RequestMapping(value = "/nomember_detail.od") 
	public int nomember_detail(HttpServletRequest request, String order_num, String pw) {
		HashMap<String, String> map  = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("order_num", order_num);
		
		
	
		return service.nomember_order_chk(map);
	}
	
	@RequestMapping("/orderlogin.od")
	public String nomember_orderform () {
		return "order/orderlogin";
	};
	
	//비회원 주문페이지
	@RequestMapping("/nomember_insert.od")
	public String nomember_insert(OrderdetailVO detail, DeliverVO deliver, HttpSession session){
		
		//임시 주문번호 생성&아이디 생성
		String order_num = create_ordernum();
		System.out.println(order_num);
	
		
		detail.setM_id(order_num);
		detail.setOrder_num(order_num);
		
		deliver.setM_id(order_num);
		deliver.setOrder_num(order_num);
		deliver.setDeliver_content("입금대기");
		
		service.insert_order(detail, deliver);
		
		
		ProductBasketVO vo = new ProductBasketVO();
		String[] info_num_list = detail.getP_info_no().split(",");
		
		for(int i = 0; i < info_num_list.length; i++) {
			vo.setP_info_no(info_num_list[i]);
			vo.setClientip((String) session.getAttribute("clientip"));
			buy.basket_delete(vo);
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/detail.od")
	public String detail_order(String order_num, Model model) {
		//주문명세서
		model.addAttribute("order", service.all_order_list(order_num));
		
		//주문 배송지
		model.addAttribute("deliver", service.deliver_order(order_num));
		
		//주문 상품 정보
		//List<ProductBasketVO> vo =  service.order_product_list(order_num);
		
		model.addAttribute("product", service.order_product_list(order_num));
		
		return "order/detail";
	}
	
	//회원 전체 주문페이지
	@RequestMapping("/insert.od")
	public String insert_order(OrderdetailVO detail, DeliverVO deliver, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		detail.setM_id(member.getM_id());
		deliver.setM_id(member.getM_id());
		
		String order_num = create_ordernum();
		
		detail.setOrder_num(order_num);
		deliver.setOrder_num(order_num);
		
		service.insert_order(detail, deliver);	//구매이력에는 넣고
		
		//장바구니에서는 삭제시키고
		ProductBasketVO vo = new ProductBasketVO();
		String[] info_num_list = detail.getP_info_no().split(",");
		
		for(int i = 0; i < info_num_list.length; i++) {
			vo.setP_info_no(info_num_list[i]);
			vo.setM_id(member.getM_id());
			buy.basket_deleteid(vo);
		}
		
		
		
		return "redirect:/";
	}
	
	//주문번호 만들기
	public String create_ordernum() {
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = fourteen_format.format(date_now).toString();
	
		
		Random random = new Random();
		date = date + random.nextInt(1000);
		
		return date;
	};
	
	
}
