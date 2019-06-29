package com.depthfirst.project.web.top.domian;

import com.depthfirst.framework.domain.BaseDomain;

public class Customer extends BaseDomain {

	private static final long serialVersionUID = -1754871100831361293L;

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

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
