package order;

import java.util.HashMap;
import java.util.List;

import productbuy.ProductBasketVO;

public interface OrderSerivce {
	int check_order_num(String order_num);//order주문번호값 중복있는지 확인
	void insert_order(OrderdetailVO order, DeliverVO deliver);//주문하기(현재 입금대기만 가능)
	OrderdetailVO all_order_list(String order_num);//전체 내가 주문한 리스트 불러오기
	DeliverVO deliver_order(String order_num);
	List<OrderdetailVO> my_order_list(String m_id);//내가 주문 현황&현재 주문한 불러오기
	List<ProductBasketVO> order_product_list(String order_num);
	void my_order_cancel(String order_num);//주문 취소하기 update
	//-날짜 비교해서 할 수 있지 않을까? 이전에 주문했던거 불러오기
	List<OrderdetailVO> all_list(OrderdetailVO order); //전체 주문한 현황 불러오기
	
	//비회원으로 주문하기
	int nomember_order_chk(HashMap<String, String> map);//비회원으로 주문한거 확인하기
	
	//관리자가 입금확인업데이트 하기
	void order_status_update(OrderdetailVO vo);
	
	//전체 배송리스트
	DeliverPage deliver_list(DeliverPage page);
	
	List<OrderdetailVO> grap_list();
	List<DeliverVO> grap_list_deliver();
	
	
}
