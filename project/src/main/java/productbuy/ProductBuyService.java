package productbuy;

import java.util.List;

import product.ProductInfoVO;

public interface ProductBuyService {
	
	//Basket 서비스
	List<ProductBasketVO> basket_list_id(String m_id);
	List<ProductBasketVO> basket_list_client_ip(String clientip);
	int basket_insert(ProductBasketVO basket);
	int basket_delete(ProductBasketVO basket);
	int basket_deleteid(ProductBasketVO basket);
	
	List<ProductInfoVO> prdocut_option_list(String p_num);
	void product_option_update(ProductInfoVO prouct_info);
	void product_option_insert(ProductInfoVO product_info);	
	
	void product_option_delete_all(String p_num);
	
	
	
	
	
}
