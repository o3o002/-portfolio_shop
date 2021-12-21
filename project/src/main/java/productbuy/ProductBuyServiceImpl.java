package productbuy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.ProductInfoVO;

@Service
public class ProductBuyServiceImpl implements ProductBuyService {
	@Autowired private ProductBuyDAO dao;
	

	@Override
	public int basket_insert(ProductBasketVO basket) {
		return dao.basket_insert(basket);
	}

	@Override
	public int basket_delete(ProductBasketVO basket) {
		return dao.basket_delete(basket);
	}

	@Override
	public List<ProductBasketVO> basket_list_id(String m_id) {
		return dao.basket_list_id(m_id);
	}

	@Override
	public List<ProductBasketVO> basket_list_client_ip(String clientip) {
		return dao.basket_list_client_ip(clientip);
	}

	@Override
	public int basket_deleteid(ProductBasketVO basket) {
		return dao.basket_deleteid(basket);
	}

	@Override
	public List<ProductInfoVO> prdocut_option_list(String p_num) {
		return dao.prdocut_option_list(p_num);
	}

	@Override
	public void product_option_update(ProductInfoVO prouct_info) {
		 dao.product_option_update(prouct_info);
	}

	@Override
	public void product_option_insert(ProductInfoVO product_info) {
		dao.product_option_insert(product_info);
	}

	@Override
	public void product_option_delete_all(String p_num) {
		dao.product_option_delete_all(p_num);
	}

}
