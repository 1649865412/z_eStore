<%@tag import="com.cartmatic.estore.catalog.service.ProductTypeManager"%>
<%@
	tag import="com.cartmatic.estore.core.util.ContextUtil"%><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ 
	attribute name="var" required="true"  type="java.lang.String"%><%
	ProductTypeManager productTypeManager=(ProductTypeManager)ContextUtil.getInstance().getSpringBeanById("productTypeManager");
request.setAttribute(var,productTypeManager.getAll());
%>