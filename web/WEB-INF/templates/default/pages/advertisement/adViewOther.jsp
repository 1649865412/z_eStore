<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<c:forEach var="item" items="${ads}" end="1">
	<c:if test="${showType != ''}">
		<content:displayIndexAd ad="${item}" showType="${showType}"/>
	</c:if>
	<c:if test="${showType == ''}">
		<content:displayOneAd ad="${item}"/>
	</c:if>
</c:forEach>