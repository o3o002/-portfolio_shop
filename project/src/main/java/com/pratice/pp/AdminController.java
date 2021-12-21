package com.pratice.pp;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import common.CommonService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import member.MemberServiceImpl;
import member.MemberVO;
import order.DeliverPage;
import order.DeliverVO;
import order.OrderServiceImpl;
import order.OrderdetailVO;
import product.ProductInfoVO;
import product.ProductPage;
import product.ProductServiceImpl;
import product.ProductVO;
import productbuy.ProductBasketVO;
import productbuy.ProductBuyServiceImpl;

@Controller
public class AdminController {
	
	@Autowired MemberServiceImpl member;
	@Autowired OrderServiceImpl order;
	@Autowired ProductServiceImpl product;
	@Autowired CommonService common;
	@Autowired ProductBuyServiceImpl productBuy;
	
	
	@Autowired ProductPage page;
	@Autowired DeliverPage deliverpage;
	
	
	
	
	
	@RequestMapping("/order_cancle.ad")
	public String order_cancel(String order_num) {
		order.my_order_cancel(order_num);
		return "redirect:/deliver_modify.ad?order_num=" + order_num;
	}
	
	@RequestMapping("/deliver_modify.ad")
	public String deliver_modify(String order_num, Model model) {
		//주문명세서
				model.addAttribute("order", order.all_order_list(order_num));
				
				//주문 배송지
				model.addAttribute("deliver", order.deliver_order(order_num));
				
				//주문 상품 정보
				//List<ProductBasketVO> vo =  service.order_product_list(order_num);
				
				model.addAttribute("product", order.order_product_list(order_num));
		return "admin/deliver_modify";
	}
	
	@RequestMapping("/deliverlist.ad")
	public String deliver_list(Model model, HttpSession session, String keyword, String search, @RequestParam(defaultValue="1") int curPage) {
		session.setAttribute("category", "deliver");
		
		deliverpage.setCurPage(curPage);
		deliverpage.setSearch(search);
		deliverpage.setKeyword(keyword);
		model.addAttribute("page", order.deliver_list(deliverpage));
		model.addAttribute("grapJSON", grap_dliver().toString());
		return "admin/deliver_list";
	}
	
	public JSONArray grap_dliver() {
		List<DeliverVO> deliver_list = order.grap_list_deliver();
		
		JSONArray jarray = new JSONArray();
		
		for(DeliverVO deliver_vo: deliver_list) {
			JSONObject obj = new JSONObject();
			obj.put("category", deliver_vo.getDeliver_content());
			obj.put("value", deliver_vo.getCount());
			jarray.add(obj);
		}
		
		
		
;		return jarray;
		
		
	}
	
	@RequestMapping("/porudct_delete.ad")
	public String product_delete(String p_num) {
		product.product_delete(p_num);
		productBuy.product_option_delete_all(p_num);
		return "redirect:/product.ad";
	}
	
	@RequestMapping("/option_update.ad")
	public String option_update(ProductInfoVO product_info) {
		
		
		productBuy.product_option_update(product_info);
		return "redirect:/product_option_update_form.ad?p_num=" + product_info.getP_num();
	}
	
	@RequestMapping("/option_insert.ad")
	public String option_insert(ProductInfoVO product_info) {
		productBuy.product_option_insert(product_info);
		
		return "redirect:/product_option_update_form.ad?p_num=" + product_info.getP_num();
	};
	
	@RequestMapping("/product_option_update_form.ad")
	public String produt_option_update(String p_num, Model model) {
		model.addAttribute("list", productBuy.prdocut_option_list(p_num));
		model.addAttribute("p_num", p_num);
		return "admin/product_option_detail";
	}
	
	@RequestMapping("/product_update.ad")
	public String product_update(HttpSession session,ProductVO pd, MultipartFile file) {
		ProductVO vo = product.product_detail(pd.getP_num());
		System.out.println(file.getOriginalFilename() + "filename");

		String uuid = session.getServletContext().getRealPath("resources") + vo.getFilepath();
		
		File f = new File(uuid);
		if( f.exists() ) {f.delete();}
		
		
		pd.setFilename(file.getOriginalFilename());
		pd.setFilepath(common.upload("product", file, session));

		product.product_update(pd);
		
		return "redirect:/product.ad";
	}
	
	@RequestMapping("/product_update_form.ad")
	public String product_update_form(String p_num, Model model) {
		int id = Integer.parseInt(p_num);
		model.addAttribute("product", product.product_detail(id));
		
		return "admin/product_update";
	}
	
	@RequestMapping("/product_detail.ad")
	public String product_detail(String p_num, Model model) {
		int id = Integer.parseInt(p_num);
		model.addAttribute("pd", product.product_detail(id));
		model.addAttribute("colorlist", product.product_color(id));
		return "admin/product_detail";
	}
	
	@RequestMapping("/product_insert.ad")
	public String product_insert(String options, MultipartFile file, ProductVO productvo, HttpSession session) {
		
		
		productvo.setFilename(file.getOriginalFilename());
		productvo.setFilepath(common.upload("productImg", file, session));
		
		String p_num = product.insert_product(productvo);
			
		ProductInfoVO info = new ProductInfoVO();
		List<ProductInfoVO> list = new  ArrayList<ProductInfoVO>();
		
		
		
		String[] option = options.split(" ");
		for(int i = 0; i < option.length; i++) {
			String[] item = option[i].split("/");
			info.setP_num(p_num);
			info.setColor(item[0]);
			info.setP_size(item[1]);
			info.setRemaining(  Integer.parseInt(item[2]) );
			product.insert_product_info(info);
		}
	
		
		
		
		return"redirect:/product.ad";
	};
	
	@RequestMapping(value="/ImgSubmit.ad", method = RequestMethod.GET) @ResponseBody
	public ResponseEntity<byte[]> submitImg(String fileName, String filepath, HttpSession session, HttpServletResponse response) {
	
		File file = new File(session.getServletContext().getRealPath("resources") + filepath);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	
		return result;
		
	}
	
	
	@ResponseBody @RequestMapping(value="/product_write_img_upload.ad", method=RequestMethod.POST)
	public void product_detail_upload(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
	String filepath = common.upload("product", upload, session);
	
	String fileName = upload.getOriginalFilename();	
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();
		
		String fileUrl = "ImgSubmit.ad?filepath=" + filepath + "&fileName=" + fileName;
		printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\"" + fileUrl +"\"}"); 
		
		
		printWriter.flush(); 
	}
	
	@ResponseBody @RequestMapping("/option_category")
	public List<String> option_category(String itemType1, Model model) {
		
		List<String> itemtype2 = product.load_product_itemType2(itemType1);
		return itemtype2;
	}
	
	@RequestMapping("/product_write.ad")
	public String product_write() {
		
		return "admin/product_write";
	}
	
	@RequestMapping("/product.ad")
	public String main_product_page(HttpSession session, Model model, String keyword, String search, @RequestParam(defaultValue = "1") int curPage) {

		
		
		session.setAttribute("category", "product");
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", product.product_all_list(page));
		model.addAttribute("chartJSON", product_chart());
		return "admin/main_product";
	};
	
	public String product_chart() {
		JSONArray jarray = new JSONArray();
		
		List<ProductVO> list = product.rownum_10_product();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("country", list.get(i).getP_name());
			obj.put("value",Integer.parseInt(list.get(i).getReadcnt()));
			jarray.add(obj);
		};
		return jarray.toString();
	};
	
	
	@RequestMapping("/orderstatus_update.ad")
	public String orderstatus_update(String order_num, String order_status) {
		OrderdetailVO vo = new OrderdetailVO();
		
		//System.out.println(order_status);
		vo.setOrder_num(order_num);
		vo.setOrder_status(order_status);
		order.order_status_update(vo);
		return "redirect:/order_status.ad";
	}
	
	@RequestMapping("/order_status.ad")
	public String orderlist(HttpSession session, Model model, String keyword, String search) {
		session.setAttribute("category", "money");

		OrderdetailVO ordervo = new OrderdetailVO();
		ordervo.setSearch(search);
		ordervo.setKeyword(keyword);
		
		
		grap_data();
		
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		model.addAttribute("order", order.all_list(ordervo));
		model.addAttribute("chartJSON", grap_data().toString());
		
		
		return "admin/order_list";
	}
	
	public JSONArray grap_data(){
		
		List<OrderdetailVO> order_list = order.grap_list();
		
		
		JSONArray jarray = new JSONArray();
		
		for(OrderdetailVO order_vo: order_list) {
			JSONObject obj = new JSONObject();
			obj.put("category", order_vo.getOrder_status());
			obj.put("value", order_vo.getCount());
			jarray.add(obj);
		}
		
		
		
;		return jarray;
	}
	@RequestMapping("/member_detail.ad")
	public String member_detail(String m_email, Model model) {
		model.addAttribute("member", member.member_detail(m_email));
		return "admin/member_detail";
	}
	
	@RequestMapping("/member_delet.ad")
	public String member_delete(String m_email) {
		member.member_delete(m_email);
		return "redirect:/member.ad";
	}
	
	@RequestMapping("/member_update.ad")
	public String member_update(MemberVO vo ) {
		member.member_update(vo);
		return "redirect:/member.ad";
	}
	
	@RequestMapping("/admin.ad")
	public String adminPage(HttpSession session) {
		
		return "admin/page";
	}
	
	@RequestMapping("/member.ad")
	public String member(HttpSession session, Model model, String keyword, String search) {
		session.setAttribute("category", "member");
		
		MemberVO vo = new MemberVO();
		vo.setKeyword(keyword);
		vo.setSearch(search);
		
		model.addAttribute("member", member.member_list(vo));
		return "admin/memberlist";
	}

}
