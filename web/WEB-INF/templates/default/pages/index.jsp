<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="sales" tagdir="/WEB-INF/tags/sales"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>

<html>
<head>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    
    <%--<script src="${resPath }/fashionPort/js/jquery.min.js" type="text/javascript"></script>--%>

    <script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/jquery.jcarousel.min.js" type="text/javascript"></script>
    

    <script type="text/javascript"> 
    jQuery(document).ready(function() {
        jQuery('#proShList').jcarousel({scroll:1,auto:5,wrap:"circular"});
        jQuery('#newsShList').jcarousel({scroll:1,auto:5,wrap:"circular"}); 
    });   
    </script>

</head>
<body>

    <div class="banner">
        <div class="flexslider">
            <ul class="slides">
            	<content:showIndexAd adPositionType="mainad1"  showType="1" />
            	<content:showIndexAd adPositionType="mainad2"  showType="1" />
            	<content:showIndexAd adPositionType="mainad3"  showType="1" />
            	<content:showIndexAd adPositionType="mainad4"  showType="1" />
            </ul>
        </div>
    </div>

    <script type="text/javascript">
    $(function(){
	    $('.flexslider').flexslider({
		    directionNav: true,
		    pauseOnAction: false
	    });
    });
    </script>

    <div class="ind_center">
        <div class="clear">
        </div>
        <div class="ind_news">
            <div class="news_bod">
                <div class=" jcarousel">
                    <div class="jcarousel-container jcarousel-container_news">
                        <div class="jcarousel-clip jcarousel-clip-horizontal_news">
                            <ul class="jcarousel-list jcarousel-list-horizontal" id="newsShList">
                            	<c:forEach items="${brandInforList}" var="brandInfor">
	                            	<li class="jcarousel-list jcarousel-list-horizontal" jcarouselindex="1">
	                                    <div class="sorl_body">
	                                        <div class="tit">
	                                            入驻品牌新闻
	                                        </div>
	                                        <a href="${ctxPath }/information.html?inforId=${brandInfor.id }&ss=1">
		                                        <div class="tit_2">
		                                            ${brandInfor.title }
		                                        </div>
		                                        <div class="con">
		                                        	${brandInfor.content }
		                                            <p style="border-bottom: 1px solid #cecfcf; padding-top: 12px;">
		                                            </p>
		                                        </div>
		                                        <div class="pic">
		                                        		<cartmatic:img url="${brandInfor.image}" mediaType="other" alt=""  width="242" height="261"/>
		                                        </div>
	                                        </a>
	                                        <div class="ccn">
	                                        </div>
	                                    </div>
	                                </li>
                            	</c:forEach>
                            </ul>
                        </div>
                        <div class="jcarousel-prev jcarousel-prev-horizontal newLeft" style="display: block;"
                            disabled="false">
                        </div>
                        <div class="jcarousel-next jcarousel-next-horizontal newRight" style="display: block;"
                            disabled="false">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="ind_info fl">
            <div class="info_1">
                <div class="tit">
                    品牌特惠
                    <span class="fr"><a href="${ctxPath }/designer/index.html">more</a></span>
                </div>
                <div>
                	<content:showAd adPositionType="brand_promo"></content:showAd>
                	<%--<c:forEach items="${brandList}" var="brand" end="0">
						    <a href="${ctxPath}/search-prod.html?brandId=${brand.id}">
						    	<cartmatic:img url="${brand.icon}"  mediaType="other" width="320" height="226"></cartmatic:img>
						    </a>
					</c:forEach>--%>
                </div>
            </div>
            <div class="info_2">
                <div class="info_vid">
                        <content:showAd adPositionType="index_video"></content:showAd>
                </div>
                <div class="info_txt">
                </div>
            </div>
        </div>
        <div class="ind_info_2 fl">
            <div class="fn_1">
                时尚资讯<span class="fr"><a href="${ctxPath }/information_all.html"><img src="${resPath }/fashionPort/images/index_more.jpg" /></a></span>
            </div>
            <div class="fn_2">
            	<c:forEach items="${fashionInforList}" var="fashionInfor" end="0">
	            	<a href="${ctxPath }/information.html?inforId=${fashionInfor.id }&ss=1">
		                <p>
		                    	<cartmatic:img url="${fashionInfor.image}" mediaType="other" alt="" width="208" height="126"/>
		                </p>
		                <p style="margin-top: 5px;">
		                	${fashionInfor.content }
		                </p>
	                </a>
                </c:forEach>
            </div>
            <div class="fn_3">
                <div class="ffn_1">
                    线下活动<span class="fr"><a href="${ctxPath }/information_all.html"><img src="${resPath }/fashionPort/images/index_more.jpg" /></a></span>
                </div>
                <div class="ffn_2">
                	<c:forEach items="${activityInforList}" var="activityInfor" end="0">
                		<a href="${ctxPath }/information.html?inforId=${activityInfor.id }&ss=1">
		                    <ul>
		                        <li>${activityInfor.content }</li>
		                    </ul>
		                    <div>
		                    	<cartmatic:img url="${activityInfor.image}" mediaType="other" alt=""  width="207" height="133"/>
		                    </div>
	                    </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <div class="ind_center_2">
        <div class="serv_more">
        </div>
        <div class="sm_1">
        	<content:showIndexAd adPositionType="3adbanner_D" showType="2"/>
        </div>
        <div class="ind_ros">
            <div class="rs_1 fl">
                <div class="rss">
                	<content:showIndexAd adPositionType="3adbanner_A" showType="2"/>
                </div>
            </div>
            <div class="rs_2 fl">
                <div class="rss">
                	<content:showIndexAd adPositionType="3adbanner_B" showType="2"/>
                </div>
            </div>
            <div class="rs_3 fl">
                <div class="rss fr">
                	<content:showIndexAd adPositionType="3adbanner_C" showType="2"/>
                </div>
            </div>
        </div>
        <div class="blank45">
        </div>
        <div class="srl_pos">
            <div class="srl_logo">
            </div>
            <div class="blank10">
            </div>
            <div class=" jcarousel">
                <div class="jcarousel-container">
                    <div class="jcarousel-clip jcarousel-clip-horizontal">
                        <ul class="jcarousel-list jcarousel-list-horizontal" id="proShList">
                            <jsp:include flush="true" page="/sales/recommendedProduct.html">
								<jsp:param name="typeName" value="hot_sell" />
								<jsp:param name="firstResult" value="0" />
								<jsp:param name="maxResults" value="10" />
								<jsp:param name="template"
									value="sales/include/recommendProduct4MainPage3" />
								<jsp:param name="doAction" value="defaultAction" />
								<jsp:param name="sourceId"
									value="${appConfig.store.catalog.categoryId}" />
							</jsp:include>
                        </ul>
                    </div>
                    <div class="jcarousel-prev jcarousel-prev-horizontal proLeft" style="display: block;"
                        disabled="false">
                    </div>
                    <div class="jcarousel-next jcarousel-next-horizontal proRight" style="display: block;"
                        disabled="false">
                    </div>
                </div>
            </div>
            <div class="blank28">
            </div>
        </div>
    </div>
    

</body>
</html>

