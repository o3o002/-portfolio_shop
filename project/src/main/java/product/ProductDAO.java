package product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productbuy.ProductBasketVO;

@Repository
public class ProductDAO implements ProductService{
	
	@Autowired private SqlSession  sql;

	@Override
	public List<ProductVO> product_list() {
		return sql.selectList("prodcut.mapper.list");
	}

	@Override
	public ProductVO product_detail(int id) {
		sql.update("prodcut.mapper.readcnt_update", id);
		return sql.selectOne("prodcut.mapper.detail", id);
	}

	@Override
	public ProductPage bigcategory(ProductPage page) {
		page.setTotalList((Integer) sql.selectOne("prodcut.mapper.totalList", page));
		page.setList(sql.selectList("prodcut.mapper.list", page));
	
		return page;
	}

	@Override
	public ProductPage category_list(ProductPage page) {
		page.setTotalList((Integer) sql.selectOne("prodcut.mapper.categoryTotalList" ,page));
		page.setList(sql.selectList("prodcut.mapper.sublist", page));

		return page;
	}

	@Override
	public List<ProductVO> itemTypeCategory(String itemType1) {
		return sql.selectList("prodcut.mapper.itemTypeCategory", itemType1);
	}

	@Override
	public List<String> product_color(int id) {
		return sql.selectList("prodcut.mapper.productColor", id);
	}

	@Override
	public List<ProductInfoVO> product_size(ProductInfoVO infoVo) {
		return sql.selectList("prodcut.mapper.productSize", infoVo);
	}

	@Override
	public List<String> load_product_itemType2(String itemType1) {
		return sql.selectList("prodcut.mapper.load_itemType2", itemType1);
	}

	@Override
	public String insert_product(ProductVO vo) {
		sql.insert("prodcut.mapper.insert_product",vo);
		
		return sql.selectOne("prodcut.mapper.p_num", vo.getP_name());
	}

	@Override
	public int insert_product_info(ProductInfoVO info) {
		sql.insert("prodcut.mapper.insert_info", info);
		
		return 0;
	}

	@Override
	public ProductPage product_all_list(ProductPage page) {
		page.setTotalList((Integer) sql.selectOne("prodcut.mapper.all_totalList" ,page));
		page.setList(sql.selectList("prodcut.mapper.all_list", page));
		
		
	
		return page;
	}

	@Override
	public void product_update(ProductVO product) {
		sql.update("prodcut.mapper.update", product);
	}

	@Override
	public void product_delete(String p_num) {
		sql.delete("prodcut.mapper.delete", p_num);
	}

	@Override
	public String p_info_no_search(ProductBasketVO vo) {
		return sql.selectOne("prodcut.mapper.p_info_no_search", vo);
	}

	@Override
	public List<ProductVO> rownum_10_product() {
		return sql.selectList("prodcut.mapper.row_product");
	}

	@Override
	public List<ProductVO> new_products() {
		return sql.selectList("prodcut.mapper.new_products");
	}



}
