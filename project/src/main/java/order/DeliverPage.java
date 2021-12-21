package order;

import java.util.List;

import org.springframework.stereotype.Component;

import page.PageVO;

@Component
public class DeliverPage extends PageVO{
	private List<DeliverVO> deliver_list;

	public List<DeliverVO> getDeliver_list() {
		return deliver_list;
	}

	public void setDeliver_list(List<DeliverVO> deliver_list) {
		this.deliver_list = deliver_list;
	}
	
	
}
