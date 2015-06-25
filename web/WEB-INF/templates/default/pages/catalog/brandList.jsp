<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
		
<div class="dn_main">
    <div class="dn_brand fl">
        <div class="brd_tit">
            品牌
        </div>
        <div class="brd_con">
            <ul>
                <li><a href="${ctxPath}/${code}_catalog.html">品牌 A-Z</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=accessories">配饰品牌</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=pack">包装品牌</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=dress">服装品牌</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=jewelry">首饰品牌</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=shoe">鞋履品牌</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=playsuit">运动装</a></li>
                <li><a href="${ctxPath}/${code}_catalog.html?brandCode=cosmetology">美容</a></li>
            </ul>
            <div class="brd_con_mor">
                <ul>
                	<c:forEach items="${brandList}" var="brand" begin="0" end="7">
						    <li>
						    	<a href="${ctxPath}/${code}_catalog.html?brandId=${brand.id}">${brand.brandName }</a>
							</li>	
					</c:forEach>
                </ul>
                <ul>
                    <c:forEach items="${brandList}" var="brand" begin="8" end="15">
						    <li>
						    	<a href="${ctxPath}/${code}_catalog.html?brandId=${brand.id}">${brand.brandName }</a>
							</li>
					</c:forEach>
                </ul>
                <ul>
                    <c:forEach items="${brandList}" var="brand" begin="16" end="23">
						    <li>
						    	<a href="${ctxPath}/${code}_catalog.html?brandId=${brand.id}">${brand.brandName }</a>
							</li>			
					</c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="dn_bad fl">
        <c:forEach items="${brandList}" var="brand" end="0">
        	<cartmatic:img url="${brand.icon}"  mediaType="other"></cartmatic:img>
        </c:forEach>
    </div>
</div>