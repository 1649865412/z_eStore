<%@tag import="com.cartmatic.estore.catalog.service.BrandManager"%>
<%@
	tag import="com.cartmatic.estore.core.util.ContextUtil"%><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ 
	attribute name="var" required="true"  type="java.lang.String"%><%
	BrandManager brandManager=(BrandManager)ContextUtil.getInstance().getSpringBeanById("brandManager");
request.setAttribute(var,brandManager.getAll());
%>