package com.pratice.pp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.assembler.MethodNameBasedMBeanInfoAssembler;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.html.HTMLTableCaptionElement;

import member.MemberVO;
import product.ProductServiceImpl;
import product.ProductVO;
import productbuy.Buy_Product_List;
import productbuy.ProductBasketVO;
import productbuy.ProductBuyServiceImpl;

@Controller
public class ProductBuyController {
	@Autowired ProductBuyServiceImpl service;
	@Autowired ProductServiceImpl product;
	
	@RequestMapping("/all_order_member")
	public String all_order_member(Buy_Product_List list, Model model, HttpSession session) {
		model.addAttribute("basketlist", list);
		MemberVO vo = (MemberVO) session.getAttribute("loginInfo");
		String[] tel = vo.getM_tel().split(",");
		for (int i = 0; i < tel.length; i++) {
			model.addAttribute("tel" + i, tel[i]);
		}
		return "product/check_order_member";
	}
	
	@RequestMapping("/check_order")
	public String check_order(Buy_Product_List list, Model model, HttpSession session) {
		model.addAttribute("basketlist", list);
		
		if(session.getAttribute("loginInfo") == null) {
			return "product/check_order_nomember";			
		} else {
			MemberVO vo = (MemberVO) session.getAttribute("loginInfo");
			String[] tel = vo.getM_tel().split(",");
			
			for(int i = 0; i < tel.length; i++) {
				model.addAttribute("tel" + i, tel[i]);
			}
			return "product/check_order_member";
		}
	}
	
	@RequestMapping("/ordernow.buy")
	public String ordernow(ProductBasketVO basket, Model model, HttpSession session) {
		
		model.addAttribute("p_info_no", product.p_info_no_search(basket));
		model.addAttribute("product", product.product_detail(basket.getP_num()));
		model.addAttribute("basket", basket);
		
		//만약 로그인이 되어있다면 정보 넘기기.
		if( session.getAttribute("loginInfo") != null ) {
			MemberVO vo = (MemberVO)session.getAttribute("loginInfo");
			String[] tel= vo.getM_tel().split(",");
			
			for(int i = 0; i < tel.length; i++) {
				model.addAttribute("tel" + i, tel[i]);
			}
			return "product/ordernow_member";
		}
		
		return "product/ordernow_nomember";
	}
	
	@RequestMapping("/nomemberorder.buy")
	public String nomemberodrder(Model model, HttpSession session) {
		
		MemberVO loginInfo =(MemberVO) session.getAttribute("loginInfo");
		
		if(loginInfo == null) {
			model.addAttribute("basketlist", service.basket_list_client_ip((String) session.getAttribute("clientip")));
		} else {
			model.addAttribute("basketlist", service.basket_list_id( loginInfo.getM_id())); 
		}
			
		return "product/orderform";
	}
	
	@RequestMapping("/orderlogin")
	public String orderlogin() {
		
		return "member/orderlogin";
	}
	
	@RequestMapping("/basketdelet.buy")
	public String basketdelete(ProductBasketVO basket, HttpSession session) {
		List<ProductBasketVO> basketlist = new ArrayList<ProductBasketVO>();
		String[] sizelist = basket.getP_size().split(",");
		String[] colorlist = basket.getColor().split(",");
	//	String[] p_no_list = basket.getP_INFO_NO().split(",");
		
		MemberVO loginInfo =(MemberVO) session.getAttribute("loginInfo");
		
		//아이디가 없을 때 
		if(loginInfo == null) {
		for(int i = 0; i < sizelist.length; i++) {
			basketlist.add(basket);
			basketlist.get(i).setP_size(sizelist[i]);
			basketlist.get(i).setColor(colorlist[i]);
			basketlist.get(i).setM_id((String) session.getAttribute("clientip"));
		//	basketlist.get(i).setP_INFO_NO(p_no_list[i]);
			service.basket_delete(basketlist.get(i));
		
		} 
		
		//아이디가 있을 때 
		}else {
			for(int i = 0; i < sizelist.length; i++) {
				basketlist.add(basket);
				basketlist.get(i).setP_size(sizelist[i]);
				basketlist.get(i).setColor(colorlist[i]);
				basketlist.get(i).setM_id(loginInfo.getM_id());
			//	basketlist.get(i).setP_INFO_NO(p_no_list[i]);
				
				service.basket_deleteid(basketlist.get(i));
			
			} 
		}
		
		return "redirect:basketlist.buy";
	}
	
	@RequestMapping("/basketlist.buy")
	public String basketlist(Model model, HttpSession session) {
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		
		Object sessionclientip = session.getAttribute("clientip");
		String clientip = (String) sessionclientip;
		
		if(loginInfo == null ) {
			model.addAttribute("basketlist", service.basket_list_client_ip(clientip)); 
		} else {
			model.addAttribute("basketlist", service.basket_list_id(loginInfo.getM_id()));
			
		}
		
		
		return "product/basket";
	}
	
	@ResponseBody @RequestMapping(value = "/basketInsert.buy", produces = "text/html; charset= utf-8")
	public String baskertInsert(ProductBasketVO basket, Model model, HttpSession session, HttpServletRequest request ) {
		String msg = "<script type=\'text/javascript\'>";
		
		String[] colorlist = basket.getColor().split(",");
		String[] sizelist = basket.getP_size().split(",");
		String[] p_countlist = basket.getProduct_count().split(",");
	//	String[] no_list = basket.getP_INFO_NO().split(",");
		
		
		List<ProductBasketVO> basketlist = new ArrayList<ProductBasketVO>();
		
		int success = 0;
		
		 for(int i = 0; i < colorlist.length; i++) {
			basketlist.add(basket);
			basketlist.get(i).setProduct_count(p_countlist[i]);
			basketlist.get(i).setColor(colorlist[i]);
			basketlist.get(i).setP_size(sizelist[i]);
		//	basketlist.get(i).setP_INFO_NO(no_list[i]);

			success += service.basket_insert(basketlist.get(i));
		}  
		
		 if(success > 0) {
			 msg +="var response = confirm('장바구니에 상품이 담겼습니다! 장바구니로 이동하시겠습니까?'); ";
			 msg +="if(response){ location='" + request.getContextPath() + "/basketlist.buy'; }";
			 msg +="else {history.go(-1); }";
		 } else {
			 msg += "alert('장바구니에 상품 등록을 실패했습니다. 다시 시도해주세요!'); ";
			 msg += "history.go(-1); ";
		 }
		 
		 msg +="</script>";
		 
		return msg;
	}
}
