package com.pratice.pp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import product.ProductInfoVO;
import product.ProductPage;
import product.ProductServiceImpl;
import review.ReviewPage;
import review.ReviewServiceImple;
import review.ReviewVO;

@Controller
public class ProductController {

	@Autowired private ProductServiceImpl service;
	@Autowired private ProductPage page;
	@Autowired private ProductInfoVO infovo;
	
	@Autowired private ReviewServiceImple review;
	@Autowired private ReviewPage reviewpage;
	
	
	
	@RequestMapping("/productSize") @ResponseBody
	public List<String> product_size(String id, String color){
		infovo.setP_num(id);
		infovo.setColor(color);
		
		
		
		List<ProductInfoVO> productcount = service.product_size(infovo);
		ArrayList<String> sizelist = new ArrayList<String>();
		
		for (ProductInfoVO productcountlist : productcount) {
			if ( productcountlist.getRemaining() > 0 ) {
				sizelist.add(productcountlist.getP_size());	
			} else { 
				sizelist.add(productcountlist.getP_size() + " [품절]");
			}
			
		}
		return sizelist;
	}
	
	
	@RequestMapping("/sublist.pd")
	public String sublist(String itemType1, String itemType2, Model model, @RequestParam(defaultValue = "1") int curPage,
						@RequestParam(defaultValue="update") String sort) {
		
		page.setCurPage(curPage);
		page.setItemType1(itemType1);
		page.setItemType2(itemType2);
		page.setSort(sort);
		
		model.addAttribute("page", service.category_list(page));
		model.addAttribute("itemCategory", service.itemTypeCategory(itemType1));
		
		model.addAttribute("itemType1", itemType1);
		model.addAttribute("itemType2", itemType2);
		
		
		
		return "product/category_list";
	}
	

	
	@RequestMapping("/list.pd")
	public String list(String itemType1, Model model, @RequestParam(defaultValue = "1") int curPage,
						@RequestParam(defaultValue="update")String sort ) {
		
		page.setCurPage(curPage);
		page.setItemType1(itemType1);
		page.setSort(sort);
		
		model.addAttribute("page", service.bigcategory(page));
		model.addAttribute("itemCategory", service.itemTypeCategory(itemType1));
		
		return "product/bigcategory_list";
	}

	
	//상품 상세보기 
	@RequestMapping("/go_detail")
	public String ProductDetail(HttpSession session, int id, Model model, @RequestParam(defaultValue = "1") int curPage ) {
		model.addAttribute("pd", service.product_detail(id));
		model.addAttribute("colorlist", service.product_color(id));
		
		reviewpage.setCurPage(curPage);
	//	ReviewPage page = review.review_list(reviewpage);
		
		
	//	model.addAttribute("totalgrade", totalgrade(page));
	//	model.addAttribute("review",page );
		model.addAttribute("crlf", "\r\n");
				
		return "product/p_detail";
	}
	
	//상품 평점 계산기
	public double totalgrade(ReviewPage reviewpage2) {
		int totalgrade = 0;
		int gradecount = 0;
		reviewpage2.getList().size();
		
		for(int i = 0; i < reviewpage2.getList().size(); i++) {
			totalgrade += reviewpage2.getList().get(i).getGrade();
			if(reviewpage2.getList().get(i).getGrade() > 0) {
				gradecount += 1;
			}
		}
		
		double aveggrade = totalgrade / gradecount ;
		
		return aveggrade;
	}
}
