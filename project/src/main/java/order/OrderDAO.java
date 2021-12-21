package order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productbuy.ProductBasketVO;

@Repository
public class OrderDAO implements OrderSerivce{
	@Autowired SqlSession sql;
	@Override
	public void insert_order(OrderdetailVO order, DeliverVO deliver) {
		sql.insert("order.mapper.insert_order", order);
		sql.insert("order.mapper.insert_deliver",deliver);
		
		String[] p_info_no_list = order.getP_info_no().split(",");
		String[] count_list = order.getCount().split(",");
		
		for(int i = 0; i < p_info_no_list.length; i++) {
			order.setP_info_no(p_info_no_list[i]);
			order.setCount(count_list[i]);
			sql.insert("order.mapper.insert_p_order", order);
		}
	}



	@Override
	public List<OrderdetailVO> my_order_list(String m_id) {
		return sql.selectList("order.mapper.order_my_list", m_id);
	}

	@Override
	public void my_order_cancel(String order_num) {
		sql.delete("order.mapper.delete_deliver", order_num);
		sql.delete("order.mapper.delete_p_order", order_num);
		sql.update("order.mapper.cancel_order_status", order_num);
		
	}

	@Override
	public int check_order_num(String order_num) {
		return sql.selectOne("order.mapper.order_num_chk", order_num);
	}

	@Override
	public int nomember_order_chk(HashMap<String, String> map) {
		return sql.selectOne("order.mapper.nomember_order_chk", map);
	}

	@Override
	public OrderdetailVO all_order_list(String order_num) {
		return sql.selectOne("order.mapper.detail_order",order_num);
	}

	@Override
	public DeliverVO deliver_order(String order_num) {
		return sql.selectOne("order.mapper.detail_addr", order_num);
	}

	@Override
	public List<ProductBasketVO> order_product_list(String order_num) {
		
		return sql.selectList("order.mapper.list_product", order_num);
	}



	@Override
	public List<OrderdetailVO> all_list(OrderdetailVO order) {
		return sql.selectList("order.mapper.all_list", order);
	}



	@Override
	public void order_status_update(OrderdetailVO vo) {
		sql.update("order.mapper.status_update", vo);
	}



	@Override
	public DeliverPage deliver_list(DeliverPage page) {
		page.setTotalList((Integer) sql.selectOne("order.mapper.totalList"));
		page.setDeliver_list(sql.selectList("order.mapper.deliver_list",page));
		
		return page;
	}



	@Override
	public List<OrderdetailVO> grap_list() {
		return sql.selectList("order.mapper.grap_list");
		
	}



	@Override
	public List<DeliverVO> grap_list_deliver() {
		return sql.selectList("order.mapper.grap_list_deliver");
	}

}
