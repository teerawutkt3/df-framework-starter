package com.depthfirst.project.web.top.strust;

import com.depthfirst.framework.search.SearchCondition;

public class TaskCondition extends SearchCondition {

	private static final long serialVersionUID = -2254002120700346609L;
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

	public String getTitleLikeField() {
		return "title";
	}

	public String getDescription() {
		return description;
	}
	
	public String getDescriptionLikeField() {
		return "description";
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
