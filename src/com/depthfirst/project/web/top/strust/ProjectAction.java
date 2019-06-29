package com.depthfirst.project.web.top.strust;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.depthfirst.framework.struts.BaseDomainAction;
import com.depthfirst.framework.util.FormatUtil;
import com.depthfirst.project.web.top.domian.Project;

public class ProjectAction extends BaseDomainAction {

	@Override
	public ActionForward doSave(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ProjectForm form = (ProjectForm) actionForm;
		Project customer = (Project)form.getFormData();			
		customer.setCode(this.generateCode("PRO"));
		return super.doSave(actionMapping, actionForm, request, response);
	}
	
	private static final String YYYYMMDDHHMMSS = "yyyyMMddHHmmss";

	
	private String generateCode(String prefix) {
	
		if (prefix == null || prefix.isEmpty())
			return "";

		FormatUtil.setDatetimeFormat(YYYYMMDDHHMMSS);
		return prefix + FormatUtil.formatDatetime(new Date());
	}
}
