package com.sooin.crowdable.vo;

import java.util.Date;

public class BoardVO {
	private int num;
	private int membernum;
	private String boardid;
	private String category1;
	private String category2;
	private String category3;
	private String writer;
	private String subject;
	private String email;
	private Date regdate;
	private Date activedate;
	private Date updatedate;
	private Date enddate;
	private String content;
	private String ip;
	private String filename;
	private int filesize;
	private String activestatus;
	private String account;
	private int wantmoney;
	private int nowmoney;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		System.out.println("boardid");
		this.boardid = boardid;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getActivedate() {
		return activedate;
	}
	public void setActivedate(Date activedate) {
		this.activedate = activedate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getActivestatus() {
		return activestatus;
	}
	public void setActivestatus(String activestatus) {
		this.activestatus = activestatus;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getWantmoney() {
		return wantmoney;
	}
	public void setWantmoney(int wantmoney) {
		this.wantmoney = wantmoney;
	}
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", membernum=" + membernum + ", boardid=" + boardid + ", category1=" + category1
				+ ", category2=" + category2 + ", category3=" + category3 + ", writer=" + writer + ", subject="
				+ subject + ", email=" + email + ", regdate=" + regdate + ", activedate=" + activedate + ", updatedate="
				+ updatedate + ", enddate=" + enddate + ", content=" + content + ", ip=" + ip + ", filename=" + filename
				+ ", filesize=" + filesize + ", activestatus=" + activestatus + ", account=" + account + ", wantmoney="
				+ wantmoney + ", nowmoney=" + nowmoney + "]";
	}
	
	
	
}
