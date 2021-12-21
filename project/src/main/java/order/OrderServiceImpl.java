package order;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productbuy.ProductBasketVO;

@Service
public class OrderServiceImpl implements OrderSerivce {
	@Autowired OrderDAO dao;
	
	@Override
	public void insert_order(OrderdetailVO order, DeliverVO deliver) {
		dao.insert_order(order, deliver);
	}


	@Override
	public List<OrderdetailVO> my_order_list(String m_id) {
		return dao.my_order_list(m_id);
	}

	@Override
	public void my_order_cancel(String order_num) {
		dao.my_order_cancel(order_num);
	}

	@Override
	public int check_order_num(String order_num) {
		return dao.check_order_num(order_num);
	}

	@Override
	public int nomember_order_chk(HashMap<String, String> map) {
		return dao.nomember_order_chk(map);
	}

	@Override
	public OrderdetailVO all_order_list(String order_num) {
		return dao.all_order_list(order_num);
	}

	@Override
	public DeliverVO deliver_order(String order_num) {
		return dao.deliver_order(order_num);
	}

	@Override
	public List<ProductBasketVO> order_product_list(String order_num) {
		return dao.order_product_list(order_num);
	}


	@Override
	public List<OrderdetailVO> all_list(OrderdetailVO order) {
		return dao.all_list(order);
	}


	@Override
	public void order_status_update(OrderdetailVO vo) {
		dao.order_status_update(vo);
	}


	@Override
	public DeliverPage deliver_list(DeliverPage page) {
		return dao.deliver_list(page);
	}


	@Override
	public List<OrderdetailVO> grap_list() {
		return dao.grap_list();
	}


	@Override
	public List<DeliverVO> grap_list_deliver() {
		return dao.grap_list_deliver();
	}

}
