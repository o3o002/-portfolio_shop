package product;

public class ProductInfoVO {
	private String p_size, color, p_num;
	
	
	private int remaining, quota, sold;

	private int no;
	private int p_info_no;
	
	private int add_count;
	
	
	
	
	
	
	public int getAdd_count() {
		return add_count;
	}

	public void setAdd_count(int add_count) {
		this.add_count = add_count;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public int getP_info_no() {
		return p_info_no;
	}

	public void setP_info_no(int p_info_no) {
		this.p_info_no = p_info_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public void setColor(String color) {
		this.color = color;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public int getRemaining() {
		return remaining;
	}

	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}

	

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}
	
	
	

}
