<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>


<c:forEach items="${inforList}" var="infor">
	<div class="box">
	    <div class="pic">
	        <a href="${ctxPath }/information.html?inforId=${infor.id}">
	            <img src="${mediaPath}/other/${infor.image}"/>
	        </a>
	    </div>
	    <div class="tit">
	        <p>
	            <a href="${ctxPath }/information.html?inforId=${infor.id}">${infor.content }</a>
	        </p>
	    </div>
   </div>
</c:forEach>
