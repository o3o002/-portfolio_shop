package product;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ProductInfo extends ProductInfoVO{
	private List<ProductInfoVO> productcountlist;

	public List<ProductInfoVO> getProductcountlist() {
		return productcountlist;
	}

	public void setProductcountlist(List<ProductInfoVO> productcountlist) {
		this.productcountlist = productcountlist;
	}
	
	
	
}
