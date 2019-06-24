package com.depthfirst.project.web.tag;



import com.depthfirst.framework.search.SearchCondition;

public class NestedTextTag extends com.depthfirst.framework.tag.NestedTextTag {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7819033571627059847L;
	private String placeholder;
	
	public String getPlaceholder() {
		return placeholder;
	}
	public void setPlaceholder(String placeholder) {
		this.placeholder = placeholder;
	}

	protected void prepareOtherAttributes(StringBuffer handlers) {
		super.prepareOtherAttributes(handlers);
		if(!getDisabled()) {
			if(SearchCondition.hasValue(placeholder))
			{
				prepareAttribute(handlers, "placeholder", placeholder);
			}
		}
	}
}
