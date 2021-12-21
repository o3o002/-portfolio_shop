package productbuy;

public class ProductBasketVO {
	private String m_id, p_size, color, clientip, p_name, price, filename;
	private int p_num;
	
	private String product_count;
	private String p_info_no;
	
	
	
	
	
	
	public String getP_info_no() {
		return p_info_no;
	}
	public void setP_info_no(String p_info_no) {
		this.p_info_no = p_info_no;
	}
	public String getProduct_count() {
		return product_count;
	}
	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getColor() {
		return color;
	}
	
	public String getClientip() {
		return clientip;
	}
	public void setClientip(String clientip) {
		this.clientip = clientip;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	
}
