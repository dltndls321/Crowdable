package com.sooin.crowdable.vo;

public class DonationVO {
	private int num;
	private int boardnum;
	private int membernum;
	private int donate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public int getDonate() {
		return donate;
	}
	public void setDonate(int donate) {
		this.donate = donate;
	}
	@Override
	public String toString() {
		return "DonationVO [num=" + num + ", boardnum=" + boardnum + ", membernum=" + membernum + ", donate=" + donate
				+ "]";
	}
	
	

}
