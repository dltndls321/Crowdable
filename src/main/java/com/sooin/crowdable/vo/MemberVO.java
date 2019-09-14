package com.sooin.crowdable.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class MemberVO implements Serializable{

	/**
	 * 직렬화 검색 ㄱ 나도잘모름  Serializable
	 */
	private static final long serialVersionUID = -7191804443791422149L;

	private String email;
	
	private String passwd;
	
	private String name;
	
	private String phone;
	
	private String address;
	
	private int num;
	
	private String content;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	
	
}
