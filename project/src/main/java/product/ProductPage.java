package product;

import java.util.List;

import org.springframework.stereotype.Component;

import board.BoardVO;
import page.PageVO;

@Component
public class ProductPage extends PageVO {
	private List<ProductVO> list;



	public List<ProductVO> getList() {
		return list;
	}

	public void setList(List<ProductVO> list) {
		this.list = list;
	}
	
	
}
