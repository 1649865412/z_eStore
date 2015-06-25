package com.cartmatic.estoresf.webapp.wrapper;

import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class RemoveParamWrapper extends HttpServletRequestWrapper {

	private Map params;

	public RemoveParamWrapper(HttpServletRequest originalRequest) {
		super(originalRequest);
		params = originalRequest.getParameterMap();
/*		Iterator iter = params.keySet().iterator();
		while (iter.hasNext()) {
			iter.remove();
			params.remove(iter.next());
		}*/
		params.clear();
	}

	public Map getParameterMap() {
		return params;
	}

	public String getParameter(String name) {
		return (String) params.get(name);
	}

	public Enumeration getParameterNames() {
		return Collections.enumeration(params.keySet());
	}

	public String[] getParameterValues(String name) {
		return (String[]) params.get(name);
	}
}
