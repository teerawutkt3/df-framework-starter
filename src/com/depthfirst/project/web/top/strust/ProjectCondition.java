package com.depthfirst.project.web.top.strust;

import com.depthfirst.framework.search.SearchCondition;
import com.depthfirst.project.web.top.domian.Customer;

public class ProjectCondition extends SearchCondition {

	private static final long serialVersionUID = -4173456238036814282L;
	private String code;
	private Customer customer;
	private String name;
	private Double budget;
	private String budgetStr;
	private boolean isActive = false;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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

	public Double getBudget() {
		return budget;
	}

	public void setBudget(Double budget) {
		this.budget = budget;
	}

	public String getBudgetLikeField() {
		return "budget";
	}

	public String getBudgetStr() {
		return budgetStr;
	}

	public void setBudgetStr(String budgetStr) {
		this.budgetStr = budgetStr;
	}

	public String getBudgetStrHql() {
		return "o.budget = to_number(?)";
	}
	
	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
}
