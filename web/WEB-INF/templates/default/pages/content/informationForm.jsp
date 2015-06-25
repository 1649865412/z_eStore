<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<html>
	<head>
		<title>时尚港-风尚详情</title>
		<meta name="keywords" content="时尚港-风尚详情" />
		<meta name="description" content="时尚港-风尚详情" />
		
	<script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/pubu.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/brand-p.js" type="text/javascript"></script>
    
	</head>
	<body>
	
		<div class="blank60">
	    </div>
	
		<c:if test="${infor == null}">
			<div class="pag_body_fs">
				不好意思，下面没有了。
				<br/><br/>
				<a href="<c:if test="${ss-1==0 }">javascript;;</c:if><c:if test="${ss-1>=1 }">${ctxPath }/information.html?ss=${ss-1}</c:if>">上一专题</a>
				<div class="blank28">
		        </div>
		        <div class="pd_box2">
		            <div class="bx_1">
		            </div>
		            <div class="blank28">
		            </div>
		            <div class="bx_2">
		                <ul>
		                	<jsp:include flush="true" page="/sales/recommendedProduct.html">
								<jsp:param name="typeName" value="favorite" />
								<jsp:param name="firstResult" value="0" />
								<jsp:param name="maxResults" value="4" />
								<jsp:param name="template"
									value="sales/include/recommendProduct4MainPage3" />
								<jsp:param name="doAction" value="defaultAction" />
								<jsp:param name="sourceId"
									value="${appConfig.store.catalog.categoryId}" />
							</jsp:include>
		                </ul>
		            </div>
		        </div>
		        <div class="blank60">
		        </div>
			</div>
		</c:if>
		<c:if test="${infor != null}">
			<div class="pag_body_fs">
		        <div class="fs_dt">
		            <div class="dt_lf fl">
		                <div class="tit">
		                    ${infor.title }
		                </div>
		                <div class="time">
		                	<fmt:formatDate value="${infor.updateTime }" pattern="yyyy-MM-dd HH:mm"/>
		                   &nbsp;&nbsp;&nbsp;来源：${infor.source } &nbsp;&nbsp;&nbsp;编辑：${infor.editor }
		                </div>
		                <div class="content">
		                	${infor.contentBody }
		                </div>
		                <div class="clear"></div>
		                
		                <div class="key_up">
		                    <div class="ky fl">
		                        相关专题：
		                        <c:forEach items="${relativeList}" var="rela" varStatus="ss" end="0">
			                        <c:forTokens items="${rela.keyword}" delims=" " var="key">
			                        	<span><a href="${ctxPath }/information_all.html?keyword=${key}">${key }</a></span> &nbsp;&nbsp;
			                        </c:forTokens>
		                    	</c:forEach>
		                    </div>
		                    <div class="up fr">
		                        赞 (<span>${infor.likeCount == null ? 0 : infor.likeCount }</span>)
		                    </div>
		                    <script type="text/javascript">
		                        $(".up").click(function(){
		                            var va = $(".up span").text();                            
		                            va=Number(va)+1;
		                            $.post(__ctxPath + "/information/praise.html",
		                            		{	inforId:"${infor.id}",
	                            				likeCount:va
	                            			},
	                            			function(result){
		                            			if(result.status==1){
		                            				$(".up span").html(va);
		                            			}
	                            			},
				                    "json");
		                            
		                        })
		                    </script>
		                </div>
		                
		                <div class="clear"></div>
		                <div class="share_nxt">
		                    <div class="share fl">
		                        <div class="bdsharebuttonbox">
					            	<a href="#" class="bds_qzone" data-cmd="qzone"></a>
					            	<a href="#" class="bds_tsina" data-cmd="tsina"></a>
					            	<a href="#" class="bds_tqq" data-cmd="tqq"></a>
					            	<a href="#" class="bds_renren" data-cmd="renren"></a>
					            	<a href="#" class="bds_weixin" data-cmd="weixin"></a>
					            	<a href="#" class="bds_more" data-cmd="more"></a>
				            	</div>
		                        <script>
								window._bd_share_config={
										"common":{"bdSnsKey":{},
															"bdText":"我在时尚港看到了与众不同的专题：${infor.title}，觉得不错——时尚港 www.ssgang.com　",
															"bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},
										"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"}//,
										//"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}
								};
								with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
							</script>
		                    </div>
		                    <div class="nxt fr">
		                        <a href="<c:if test="${ss-1==0 }">javascript:;</c:if><c:if test="${ss-1>=1 }">${ctxPath }/information.html?ss=${ss-1}</c:if>">上一专题</a>
		                        <a href="${ctxPath }/information.html?ss=${ss+1}">下一专题</a>
		                    </div>
		                </div>
		                <div class="blank70"></div>
		                <div class="other">
		                    <div class="otr-1">
		                        其他人还看了
		                    </div>
		                    <c:if test="${infor.keyword!=null}">
			                    <div class="otr-2">
			                        关键词：
			                        <c:forTokens items="${infor.keyword}" delims=" " var="key">
			                        	<span><a href="${ctxPath }/information_all.html?keyword=${key}">${key }</a></span> &nbsp;&nbsp;
			                        </c:forTokens>
			                    </div>
		                    </c:if>
		                    <div class="otr-3">
		                        <ul>
		                        	<c:forEach items="${alsoList}" var="infor" varStatus="ss">
		                        		<li><a href="${ctxPath }/information.html?inforId=${infor.id}&ss=${ss.index+1}">${infor.title }</a><span class="fr"><fmt:formatDate value="${infor.updateTime }" pattern="yyyy-MM-dd"/></span></li>
		                        	</c:forEach>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		            <div class="dt_rg fr">
		                <div class="tit">
		                    相关专题
		                </div>
		                <div class="rgt-1">
		                    <ul>
		                    	<c:forEach items="${relativeList}" var="rela" varStatus="ss">
			                    	<li>
			                            <div class="pic"><a href="${ctxPath }/information.html?inforId=${rela.id}&ss=${ss.index+1}"><img src="${mediaPath}/other/${rela.image2}" width="305" height="218"/></a></div>
			                            <div class="tit"><a href="${ctxPath }/information.html?inforId=${rela.id}&ss=${ss.index+1}">${rela.title }</a></div>
			                        </li>
		                    	</c:forEach>
		                    </ul>
		                </div>
		                <div class="rgt-2">
		                    <div class="tit">
		                        热门标签TAB
		                    </div>
		                    <div class="gta">
		                    	<c:forEach items="${relativeList}" var="rela" varStatus="sList">
		                    		<c:forTokens items="${rela.keyword}" delims=" " var="key" varStatus="sKey">
			                        	<a href="${ctxPath }/information_all.html?keyword=${key}" <c:if test="${sKey.index < sList.index }">class="font1"</c:if>>${key }</a>
			                        </c:forTokens>
		                    	</c:forEach>
		                    </div>
		                    <div>
		                        <content:showAd adPositionType="information"></content:showAd>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="blank28">
		        </div>
		        <div class="pd_box2">
		            <div class="bx_1">
		            </div>
		            <div class="blank28">
		            </div>
		            <div class="bx_2">
		                <ul>
		                	<jsp:include flush="true" page="/sales/recommendedProduct.html">
								<jsp:param name="typeName" value="favorite" />
								<jsp:param name="firstResult" value="0" />
								<jsp:param name="maxResults" value="4" />
								<jsp:param name="template"
									value="sales/include/recommendProduct4MainPage" />
								<jsp:param name="doAction" value="defaultAction" />
								<jsp:param name="sourceId"
									value="${appConfig.store.catalog.categoryId}" />
							</jsp:include>
		                </ul>
		            </div>
		        </div>
		        <div class="blank60">
		        </div>
		    </div>
	</c:if>
	
	</body>
</html>

