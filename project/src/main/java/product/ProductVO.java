package product;

import java.util.Date;

public class ProductVO {
	private int p_num, price, remaining, quota;
	private String p_update, p_name, content, summary, p_size, color, readcnt;
	private String p_info_no;
	
	private String filename, filepath;
	
	//itemType1 = 대분류, itemType2 = 소분
	private String itemType1, itemType2;
	


	public String getP_info_no() {
		return p_info_no;
	}

	public void setP_info_no(String p_info_no) {
		this.p_info_no = p_info_no;
	}

	public void itemType(String itemType1, String itemType2) {
		this.itemType1 = itemType1;
		this.itemType2 = itemType2;
		
	}
	
	public String getItemType1() {
		return itemType1;
	}

	public void setItemType1(String itemType1) {
		this.itemType1 = itemType1;
	}

	public String getItemType2() {
		return itemType2;
	}

	public void setItemType2(String itemType2) {
		this.itemType2 = itemType2;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRemaining() {
		return remaining;
	}

	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public String getP_update() {
		return p_update;
	}

	public void setP_update(String p_update) {
		this.p_update = p_update;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
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

	public String getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	

}
