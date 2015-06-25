<%@ tag import="org.apache.commons.lang.StringUtils"%><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@ 
	attribute name="mediaType" required="true" description="所属媒体类型，product,productMedia,category,content等。目前没有用上配置的imageType,直接指定相应的图片目录"%><%@ 
	attribute name="url" required="true" description="图片路径，相对所对目录路径"%><%@ 
	attribute name="width" %><%@ 
	attribute name="height" %><%@ 
	attribute name="id" %><%@ 
	attribute name="alt" %><%@ 
	attribute name="onLoadHandler" %><%@ 
	attribute name="onClickHandler" %><%@ 
	attribute name="mouseOverHandler" %><%@ 
	attribute name="size" description="规格目录，相应的图片目录，如a,b,c,d;默认字母越大图片越大"%><%@ 
	attribute name="isUrlOnly" type="java.lang.Boolean" description="只打印图片Url，不包含ctxPath"%><%@ 
	attribute name="isLazyload" type="java.lang.Boolean" description="延迟加载"%>
	<%@ attribute name="isList" type="java.lang.Boolean" description="是否是列表页面，是则变化图片"%>
	<%@attribute name="url2" description="图片路径，相对所对目录路径"%>
	<%
	StringBuffer urlPath=new StringBuffer();
	StringBuffer urlPath2=null;
	if(StringUtils.isNotBlank(mediaType)){
		urlPath.append(mediaType);
		urlPath.append("/");
		
	}
	if(StringUtils.isNotBlank(size)){
		urlPath.append(size);
		urlPath.append("/");
		
	}
	urlPath.append(url);
	if(StringUtils.isNotBlank(url2)){
		urlPath2=new StringBuffer();
		if(StringUtils.isNotBlank(mediaType)){
			urlPath2.append(mediaType);
			urlPath2.append("/");
		}
		if(StringUtils.isNotBlank(size)){
			urlPath2.append(size);
			urlPath2.append("/");
		}
		urlPath2.append(url2);
	}
	
%><c:choose>
	<c:when test="${not empty isUrlOnly&&isUrlOnly}">${mediaPath}<%=urlPath.toString()%></c:when>
	<c:otherwise>
		<img ${isLazyload?"original":"src"}="${mediaPath}<%=urlPath.toString()%>" <c:if test="${isLazyload}"> src="${resPath}/images/img/empty.gif"</c:if> onerror="$(this).attr('originsrc',this.src).attr('src',__defaultImage).removeAttr('onerror');$(this).attr('width',165);$(this).attr('height',165)" originsrc="" 
		<c:if test="${not empty id}"> id="${id}"</c:if> alt="<c:out value="${alt}"/>" 
		<c:if test="${not empty width}"> width="${width}"</c:if>
		<c:if test="${not empty height}"> height="${height}"</c:if>
		<c:if test="${not empty onLoadHandler}"> onLoadHandler="${onLoadHandler}"</c:if>
		<c:if test="${not empty mouseOverHandler}"> onmouseOver="${mouseOverHandler}" </c:if>
		<c:if test="${not empty onClickHandler}"> onclick="${onClickHandler}" </c:if> 
		<c:if test="${isList && url2 != null && url2 != ''}"> onmouseover='this.src="${mediaPath}<%=urlPath2.toString()%>"' onmouseout='this.src="${mediaPath}<%=urlPath.toString()%>"'</c:if>/>
	</c:otherwise>
</c:choose>