package com.depthfirst.project.web.kanoon.domain;

import com.depthfirst.framework.domain.BaseDomain;

public class KanoonCustomer  extends BaseDomain {
	private String code;
	private String name;
	private String address;
	private Boolean isActive;
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
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	

}
