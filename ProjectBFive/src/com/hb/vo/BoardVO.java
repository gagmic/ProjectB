package com.hb.vo;

import java.sql.Date;

public class BoardVO {
	private int num;
	private int no;
	private String subject;
	private String writer;
	private String password;
	private String content;
	private int readhit;
	private Date regdate;
	private int groupno;
	private int orderno;
	private int depth;
	private String filepath;
	private String filename;
	private int filesize;
	private int idx;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int num, int no, String subject, String writer,
			String password, String content, int readhit, Date regdate,
			int groupno, int orderno, int depth, String filepath,
			String filename, int filesize) {
		this.num = num;
		this.no = no;
		this.subject = subject;
		this.writer = writer;
		this.password = password;
		this.content = content;
		this.readhit = readhit;
		this.regdate = regdate;
		this.groupno = groupno;
		this.orderno = orderno;
		this.depth = depth;
		this.filepath = filepath;
		this.filename = filename;
		this.filesize = filesize;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getFilesize(){
		return this.filesize;
	}
	
	public String getStrFilesize() {
		double size = (double)this.filesize / 1024;
		String KBsize = String.format("%.2f",size);
		return KBsize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
}
