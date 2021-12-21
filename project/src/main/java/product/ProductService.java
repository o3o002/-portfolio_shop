package product;

import java.util.List;

import productbuy.ProductBasketVO;

public interface ProductService {
	
	List<ProductVO> product_list(); //itemType1 제품전체조회
	ProductVO product_detail(int id); //제품 상세 조회
	ProductPage bigcategory(ProductPage page);	//첫번째 카테고리 제품 리스트 조회
	ProductPage category_list(ProductPage page);	//두번째 카테고리 제품 리스트 조회
	
	List<ProductVO> itemTypeCategory(String itemType1);	
	
	List<String> product_color(int id);	//제품 색상조회
	List<ProductInfoVO> product_size(ProductInfoVO infoVo); //제품 사이즈 조회
	String p_info_no_search(ProductBasketVO vo);
	
	List<String> load_product_itemType2(String itemType1); //아이템 카테고리 조회
	
	String insert_product(ProductVO vo); //상품 삽입
	int insert_product_info(ProductInfoVO info);	//상품상세 삽입
	
	ProductPage product_all_list(ProductPage page);	//전체 상품조회
	void product_update(ProductVO product);	//상품 업데이트 
	void product_delete(String p_num); //상품 삭제
	
	//상위 10개 상품 가져오기
	List<ProductVO> rownum_10_product();
	
	//20개의 신상품 가져오기
	List<ProductVO> new_products();
	
}
