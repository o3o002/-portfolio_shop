package product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productbuy.ProductBasketVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired ProductDAO dao;
	
	@Override
	public List<ProductVO> product_list() {
		return dao.product_list();
	}

	@Override
	public ProductVO product_detail(int id) {
		return dao.product_detail(id);
	}

	@Override
	public ProductPage bigcategory(ProductPage page) {
		return dao.bigcategory(page);
	}

	@Override
	public ProductPage category_list(ProductPage page) {
		return dao.category_list(page);
	}

	@Override
	public List<ProductVO> itemTypeCategory(String itemType1) {
		return dao.itemTypeCategory(itemType1);
	}

	@Override
	public List<String> product_color(int id) {
		return dao.product_color(id);
	}

	@Override
	public List<ProductInfoVO> product_size(ProductInfoVO infoVo) {
		return dao.product_size(infoVo);
	}

	@Override
	public List<String> load_product_itemType2(String itemType1) {
		return dao.load_product_itemType2(itemType1);
	}

	@Override
	public String insert_product(ProductVO vo) {
		return dao.insert_product(vo);
	}

	@Override
	public int insert_product_info(ProductInfoVO info) {
		return dao.insert_product_info(info);
	}

	@Override
	public ProductPage product_all_list(ProductPage page) {
		return dao.product_all_list(page);
	}

	@Override
	public void product_update(ProductVO product) {
		dao.product_update(product);
	}

	@Override
	public void product_delete(String p_num) {
		dao.product_delete(p_num);
	}

	@Override
	public String p_info_no_search(ProductBasketVO vo) {
		return dao.p_info_no_search(vo);
	}

	@Override
	public List<ProductVO> rownum_10_product() {
		return dao.rownum_10_product();
	}

	@Override
	public List<ProductVO> new_products() {
		return dao.new_products();
	}


}
