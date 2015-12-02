package com.hb.vo;

public class ZipcodeVO {

	String zipcode ;
	String sido ;
	String gugun ;
	String dong ;
	String bunji ;
	int seqnum ;
	
	@Override
	public String toString() {
		return "ZipcodeBean [zipcode=" + zipcode + ", sido=" + sido
				+ ", gugun=" + gugun + ", dong=" + dong + ", bunji=" + bunji
				+ ", seqnum=" + seqnum + "]";
	}

	public ZipcodeVO(String zipcode, String sido, String gugun, String dong, String bunji, int seqnum) {
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.bunji = bunji;
		this.seqnum = seqnum;
	}
	public ZipcodeVO(){
		
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	public int getSeqnum() {
		return seqnum;
	}

	public void setSeqnum(int seqnum) {
		this.seqnum = seqnum;
	}
	
	
}
