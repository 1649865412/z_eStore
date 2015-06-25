<%--
所以目录没有指定显示模板的,统一由这页面显示（列表目录的产品）
--%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>

<html>
	<head>
		<c:choose>
			<c:when test="${sc.pageNo>1}">
				<title>${category.categoryName} Page (${sc.pageNo})</title>
			</c:when>
			<c:otherwise>
				<attribute:attributeValue entity="${category}" attributeValueVar="categoryTitle" attributeCode="categoryTitle"></attribute:attributeValue>
				<title>${empty categoryTitle.attributeValue ? category.categoryName : categoryTitle.attributeValue}</title>
				<meta name="keywords" content="<c:out value="${category.metaKeyword}"/>" />
				<meta name="description" content="<c:out value="${category.metaDescription}"/>" />
			</c:otherwise>
		</c:choose>
	</head>
	<body>
	
        <content tag="heading"><product:navigatorBar navigatorCategorys="${navigatorCategorys}" /></content>
        <content:showAd adPositionType="category" />
        
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
