package page;

public class PageVO {
	private int pageList = 20;
	private int blockPage = 10;
	private int totalList;
	private int totalPage;
	private int totalBlock;
	
	private int curPage;
	private int beginList, endList;

	private int beginPage, endPage;
	private String itemType1, itemType2;
	private String sort;
	
	private String search, keyword;
	
	
	
	
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
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

	private String viewType = "list"; //보여지는 형태인데, 아직 구현 안함!

	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalList() {
		return totalList;
	}

	public void setTotalList(int totalList) {
		this.totalList = totalList;
		
		totalPage = totalList / pageList;
		if(totalList % pageList > 0 ) ++totalPage;
		
		totalBlock = totalPage / blockPage;
		if(totalPage % blockPage > 0 ) ++totalBlock;
		
		endList = totalList - (curPage -1) * pageList;
		beginList = endList - (pageList -1);
		
		curBlock = curPage / blockPage;
		if(curPage % blockPage > 0) ++curBlock;
		
		endPage = curBlock * blockPage;
		beginPage = endPage - (blockPage -1);
		
		if(endPage > totalPage) endPage = totalPage;
		
		
	}
	
	private int curBlock;
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getBeginList() {
		return beginList;
	}

	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}

	public int getEndList() {
		return endList;
	}

	public void setEndList(int endList) {
		this.endList = endList;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	
	
}
