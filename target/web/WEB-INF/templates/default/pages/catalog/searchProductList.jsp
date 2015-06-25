<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<html>
	<head>
		<title>"${empty param.q?brand.brandName:param.q}" 搜索结果</title>
		<meta name="keywords" content="${empty param.q?brand.brandName:param.q}" />
	</head>
	<body>
	
			<%-- ========== 产品列表开始 ========= --%>
				<div class="con_list">
	                <ul>
						<c:if test="${empty productList}">
							<br/><br/><br/>
							<fmt:message key="product.search.empty"/>
						</c:if>
						<c:forEach items="${productList}" var="productItem" varStatus="varStatus">
							<%@ include file="include/incDefaultProductList.jspf"%>
						</c:forEach>
					</ul>
					<div class="blank20">
	                </div>
	                <%-- ========== 分页开始 ========= --%>
	                <c:if test="${not empty productList}">
	                <%@ include file="./../../decorators/include/catalogPagingTop.jsp"%>
	                </c:if>
	                <%-- ========== 分页结束 ========= --%>
	                <div class="blank45">
	                </div>
				</div>
			<%-- ========== 产品列表结束 ========= --%>
			
	</body>
</html>