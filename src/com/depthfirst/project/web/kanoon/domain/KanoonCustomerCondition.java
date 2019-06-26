package com.depthfirst.project.web.kanoon.domain;

import com.depthfirst.framework.search.SearchCondition;

public class KanoonCustomerCondition extends SearchCondition {
	private String code;
	private String name;
	private String address;
	private String isActive;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	
	
}
