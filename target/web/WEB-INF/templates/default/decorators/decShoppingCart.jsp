<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

	<head>
		<title>${appConfig.store.title}${emptySpace}<decorator:title /></title>
		<meta name="keywords" content="${appConfig.store.keyWords}" />
		<meta name="description" content="${appConfig.store.description}" />
		<%@ include file="./include/meta.jspf"%>
		<%@ include file="./include/styles3.jspf"%>
		<%@ include file="./include/javascripts.jspf"%>
		
		<%@ include file="./include/styleCommon.jspf"%>
    	
		<decorator:head />
		
	</head>
	
	<body <decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onload" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onunload" writeEntireProperty="true"/>>
		
			<%-- ========== 横幅信息 ========= --%>
		    <jsp:include flush="true" page="/content/indexMsg.html">
		    	<jsp:param name="status" value="1" />
			</jsp:include>
	
			<%-- ========== 头部 ========= --%>
		    <%@ include file="./include/header.jspf"%>
			
			<%-- ========== 菜单 ========= --%>
			<%@ include file="../pages/menu/defaultTopMenu.jsp"%>
			
			<%-- ========== 内容 ========== --%>
			<%@ include file="/common/messages.jsp"%>
           	<decorator:body></decorator:body>
           
			<%-- ========== 底部 ========== --%>
			<%@ include file="./include/footer.jspf"%>
			
	</body>
</html>