package com.depthfirst.project.web.top.strust;

import com.depthfirst.framework.search.SearchCondition;

public class CostomerCondition extends SearchCondition {

	private static final long serialVersionUID = 7354933135218909300L;

	private String code;
	private String name;
	private String address;
	private boolean isActive = false;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeLikeField() {
		return "code";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameLikeField() {
		return "name";
	}

	public String getAddress() {
		return address;
	}

	public String getAddressLikeField() {
		return "address";
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
