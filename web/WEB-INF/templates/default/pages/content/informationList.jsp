<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<html>
	<head>
		<title>时尚港-所有风尚</title>
		<meta name="keywords" content="时尚港-所有风尚" />
		<meta name="description" content="时尚港-所有风尚" />
		
	<script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/pubu.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/brand-p.js" type="text/javascript"></script>
    
	</head>
	<body>
	
		<div class="banner">
	        <div class="banner-pubu">
		        
	            <div id="focus">
	                <ul>
	                	<li><content:showAd adPositionType="lifestyle1"></content:showAd></li>
	                	<li><content:showAd adPositionType="lifestyle2"></content:showAd></li>
	                	<%--<c:forEach items="${inforList}" var="infor" end="1">
	                		<li>
	                			<div class="text">
	                				<p class="p-1">
	                					<c:choose>
	                						<c:when test="${infor.type == 1}">入驻品牌新闻</c:when>
	                						<c:when test="${infor.type == 2}">时尚展览信息</c:when>
	                						<c:when test="${infor.type == 3}">线下活动信息</c:when>
	                					</c:choose>
	                				</p>
	                				<p class="p-2">
	                					${infor.title }
	                				</p>
	                				<p class="p-3">
	                					${infor.content }
	                				</p>
	                			</div>
	                			<img src="${mediaPath}/other/${infor.image2}" class="pic fr" />
	                		</li>
	                	</c:forEach>--%>
	                </ul>
	                <div class="btn">
	                    <span class=""></span><span class=""></span>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="blank20">
	    </div>
	    <div class="pag_body">
	        <div class="wf_content">
	        	<div class="keyword" style="display: none;">
		        	<c:if test="${keyword != null && keyword != ''}">
		        		关键字：<span id="keyword">${keyword }</span>
		        	</c:if>
	        	</div>
	            <div id="pubu">
	                <c:forEach items="${inforList}" var="infor" varStatus="ss">
	                	<a href="${ctxPath }/information.html?inforId=${infor.id }&ss=${ss.index+1}">
		                	<div class="box">
			                    <div class="pic">
			                            <img src="${mediaPath}other/${infor.image}"/>
			                    </div>
			                    <div class="tit">
			                        <p>
			                            ${infor.content }
			                        </p>
			                    </div>
		                    </div>
	                    </a>
	                </c:forEach>
	            </div>
	            
	            <div class="load_more" >
	                <a href="javascript:;" id="load_more" style="display: none;">
	                    <img src="${resPath}/fashionPort/images/load_more.png" /></a>
	            </div>
	
	            <script type="text/javascript">
	            $(".box").hover(
	                function(){
	                    $(this).find(".tit").show();
	                },
	                function(){
	                    $(this).find(".tit").hide();
	                }
	            );

	            
	            </script>
	
	        </div>
	    </div>
	    
	    <div id="data">
	    
	    </div>
	</body>
</html>

