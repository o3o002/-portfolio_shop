package productbuy;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.ProductInfoVO;

@Repository
public class ProductBuyDAO implements ProductBuyService {
	 
	@Autowired private SqlSession sql;


	@Override
	public int basket_insert(ProductBasketVO basket) {
		int success = 0;
		int no = sql.selectOne("productbuy.mapper.p_no_info_find", basket);
		
		basket.setP_info_no( Integer.toString(no) );
		
		if( !basket.getM_id().isEmpty() ) {
			basket.setClientip("");
		}
		
		
		if( 0 < (Integer)sql.selectOne("productbuy.mapper.basketdetail", basket)) {
			sql.update("productbuy.mapper.basketupdate",basket);
			success = 1;
		} else {
			sql.insert("productbuy.mapper.basketinsert", basket);	
			success = 1;
		}
		
		return success;
	}

	@Override
	public int basket_delete(ProductBasketVO basket) {
		return sql.delete("productbuy.mapper.deleteip", basket);
		
	}

	@Override
	public List<ProductBasketVO> basket_list_id(String m_id) {
		return sql.selectList("productbuy.mapper.basketlistid", m_id);
	}

	@Override
	public List<ProductBasketVO> basket_list_client_ip(String clientip) {
		return sql.selectList("productbuy.mapper.basketlistip", clientip);
	}

	@Override
	public int basket_deleteid(ProductBasketVO basket) {
		return sql.delete("productbuy.mapper.deleteid", basket);
	}

	@Override
	public List<ProductInfoVO> prdocut_option_list(String p_num) {
		return sql.selectList("productbuy.mapper.option_list", p_num);
	}

	@Override
	public void product_option_update(ProductInfoVO prouct_info) {
		sql.update("productbuy.mapper.option_update", prouct_info);
	}

	@Override
	public void product_option_insert(ProductInfoVO product_info) {
		sql.insert("productbuy.mapper.option_insert", product_info);
	}

	@Override
	public void product_option_delete_all(String p_num) {
		sql.delete("productbuy.mapper.option_delete", p_num);
	}

}
