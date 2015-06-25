<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="sales" tagdir="/WEB-INF/tags/sales"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>时尚港</title>
		<meta name="keywords" content="时尚港" />
		<meta name="description" content="时尚港" />
		<meta name="baidu-site-verification" content="EFpCG3K7AR" />
		
		<%--<%@ include file="./include/meta.jspf"%>
		<link href="${resPath}/styles/global.css" rel="stylesheet" type="text/css" />
		<%@ include file="./include/styles2.jspf"%>
		<%@ include file="./include/styles3.jspf"%>
		<%@ include file="./include/styles5.jspf"%>--%>
		
		<%@ include file="./include/styleCommon.jspf"%>
    	
		<%@ include file="./include/javascripts2.jspf"%>
			
		<decorator:head />
		
	</head>
	
	<body <decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onload" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onunload" writeEntireProperty="true"/>>
		<decorator:getProperty property="page.header" />
		
			<%-- ========== 横幅信息 ========= --%>
		    <jsp:include flush="true" page="/content/indexMsg.html">
		    	<jsp:param name="status" value="1" />
			</jsp:include>
	
			<%-- ========== 头部 ========= --%>
		    <%@ include file="./include/header.jspf"%>
			
			<%-- ========== 菜单 ========= --%>
			<%@ include file="../pages/menu/defaultTopMenu.jsp"%>
			
			<%-- ========== 内容 ========== --%>
           <decorator:body></decorator:body>
           
			<%-- ========== 底部 ========== --%>
			<%@ include file="./include/footer.jspf"%>
			
	</body>
</html>