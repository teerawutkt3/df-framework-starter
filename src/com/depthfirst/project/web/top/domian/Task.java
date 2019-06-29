package com.depthfirst.project.web.top.domian;

import com.depthfirst.framework.domain.BaseDomain;

public class Task extends BaseDomain {

	private static final long serialVersionUID = 338930821654980336L;
	private String title;
	private String description;
	private Integer eatDay;
	private String status;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getEatDay() {
		return eatDay;
	}

	public void setEatDay(Integer eatDay) {
		this.eatDay = eatDay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
