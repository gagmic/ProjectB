package com.hb.vo;

public class NaviVO {
	//1,3,4,7,10,11
	private int totalRecode = 0 ; //총 레코드 건수*
	private int totalPage = 0 ; //전체 페이지 수-
	
	private int nowPage = 0 ; //현재 보이는 페이지 넘버*
	private int recodesPerPage = 20 ; //한 페이지에 보여줄 건수*
	private int beginRecode = 0 ; //현재 페이지의 시작 행-
	private int endRecode = 0 ; //현재 페이지의 끝 행-
	
	private int pagesPerNavi = 10 ; //보여줄 페이지 링크*
	private int beginPage = 0 ; //시작 페이지 링크-
	private int endPage = 0 ; //끝 페이지 링크-
	
	private String url = "/SBoardMVC/board/BoardList?" ; //네비게이션이 사용되는 리스트 페이지 주소*
	private String pagingHtml = ""; // 페이징시 들어가는 인자 값*
	private String pagingStatus = ""; 	// 페이지 스테이터스-
	
	
	public int getTotalRecode() {
		return totalRecode;
	}
	public void setTotalRecode(int totalRecode) {
		this.totalRecode = totalRecode;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage() {
		//전체 페이지의 값 = 전체 데이터 수 / 페이지 사이즈
		this.totalPage=this.totalRecode/this.recodesPerPage;
		int num = this.totalRecode%this.recodesPerPage;
		if(num != 0){
			this.totalPage += 1;
		}
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getRecodesPerPage() {
		return recodesPerPage;
	}
	public void setRecodesPerPage(int recodesPerPage) {
		this.recodesPerPage = recodesPerPage;
	}
	public int getBeginRecode() {
		return beginRecode;
	}
	public void setBeginRecode() {
		//(이전 페이지의 넘버 * 한 페이지당 보여주는 건수) +1
		this.beginRecode = ((this.nowPage-1)*this.recodesPerPage)+1;
	}
	public int getEndRecode() {
		return endRecode;
	}
	public void setEndRecode() {
		//현재 페이지 넘버 * 한 페이지당 보여주는 건수
		this.endRecode = this.nowPage*this.recodesPerPage;
		if(this.endRecode > this.totalRecode)
			this.endRecode = this.totalRecode;
	}
	public int getPagesPerNavi() {
		return pagesPerNavi;
	}
	public void setPagesPerNavi(int pagesPerNavi) {
		this.pagesPerNavi = pagesPerNavi;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage() {
		if((this.nowPage%this.pagesPerNavi)==0){
			this.beginPage = 
				((this.nowPage / this.pagesPerNavi)-1)*this.pagesPerNavi+1;
		}else{
			this.beginPage = 
					(this.nowPage / this.pagesPerNavi)*this.pagesPerNavi+1;
		}
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage() {
		if((this.nowPage % this.pagesPerNavi)==0){
			this.endPage = 
					((this.nowPage / this.pagesPerNavi))*this.pagesPerNavi;
		}else{
			this.endPage = 
					((this.nowPage / this.pagesPerNavi)+1)*this.pagesPerNavi;
		}
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPagingHtml() {
		return pagingHtml;
	}
	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	public String getPagingStatus() {
		return pagingStatus;
	}
	public void setPagingStatus(String pagingStatus) {
		this.pagingStatus = pagingStatus;
	}
	public NaviVO(int totalRecode, int nowPage) {
		this.totalRecode = totalRecode;
		this.nowPage = nowPage;
	
		setTotalPage();
		setBeginRecode();
		setEndRecode();
		setBeginPage();
		setEndPage();
		
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
	}
	
	
	
	
}


