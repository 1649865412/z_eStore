<%--
设计师界面
--%>
<!doctype html>
<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="sales" tagdir="/WEB-INF/tags/sales"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

	<head>
		<title>时尚港-所有品牌</title>	
		<meta name="keywords" content="时尚港-所有品牌" />
		<meta name="description" content="时尚港-所有品牌" />

		<%@ include file="./include/styleCommon.jspf"%>
		<%@ include file="./include/javascripts4.jspf"%>
		
		<%--<script src="${resPath }/fashionPort/js/jquery.min.js" type="text/javascript"></script>--%>
		<script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/brand.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/filters.js" type="text/javascript"></script>

    <script type="text/javascript">
      $(document).ready(function() {
      	$('.filters').filters();
      });
    </script>

    <!-- google分析统计 -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50473328-1', 'sifangstreet.com');
  ga('send', 'pageview');

</script>
	</head>
	<body>
        <decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onload" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onunload" writeEntireProperty="true"/>
		
		
			<%-- ========== 横幅信息 ========= --%>
		    <jsp:include flush="true" page="/content/indexMsg.html">
		    	<jsp:param name="status" value="1" />
			</jsp:include>
	
			<%-- ========== 头部 ========= --%>
		    <%@ include file="./include/header.jspf"%>
			
			<%-- ========== 菜单 ========= --%>
			<%@ include file="../pages/menu/defaultTopMenu.jsp"%>
			
			<%-- ========== 内容 ========== --%>
			<div class="banner">
		        <div class="banner-in">
		            <div id="focus">
		                <ul>
		                    <li>
		                        <content:showAd adPositionType="designerlist_1" /></li>
		                    <li>
		                        <content:showAd adPositionType="designerlist_2" /></li>
		                    <li>
		                        <content:showAd adPositionType="designerlist_3" /></li>
		                </ul>
		                <div class="btn">
		                    <span class=""></span><span class=""></span><span class=""></span>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="blank20">
		    </div>
		    <div class="pag_body">
		        <div class="filters designer_list">
		            <div class="filter">
					<a rel="all" href="javascript:;" class="active">全部</a><span
						class="act">|</span><a rel="lady" href="javascript:;" class="">女士</a><span>|</span>
					<a rel="man" href="javascript:;" class="">男士</a><span>|</span><a
						rel="beauty" href="javascript:;" class="">美妆</a><span>|</span>
				</div>
		            <div class="container">
		                <ul>
		                	<c:forEach items="${brandList}" var="brand">
		                		<li  class="<c:choose>
		                			<c:when test="${fn:indexOf(brand.brandCode,'lady') > -1}">lady</c:when>
		                			<c:when test="${fn:indexOf(brand.brandCode,'man') > -1}">man</c:when>
		                			<c:when test="${fn:indexOf(brand.brandCode,'beauty') > -1}">beauty</c:when>
		                		</c:choose>">
		                			<a href="${ctxPath }/search-prod.html?brandId=${brand.brandId}"><cartmatic:img url="${brand.logo}" mediaType="other"></cartmatic:img></a>
		                		</li>
		                	</c:forEach>
		                </ul>
		            </div>
		            <div class="clear">
		            </div>
		            <div class="fs_pro_load">
		                <a href="javascript:;" id="load_more"  style="display: none;">
		                    <img src="${resPath}/fashionPort/images/load_more.png" /></a>
		            </div>
		
		            <script type="text/javascript">
		                //var m=$(".container ul").find("li");                
		                //for(var i=0;i<m.length;i++){
		                //    if(i==0){$(".container ul li:first").css("margin-left","0px");}
		                //    else if(i%3==0){$(".container ul li:eq("+i+")").css("margin-left","0px"); }
		                //}
		                $(".filter a").click(function(){
		                    $(".filter").find("span").css("color","#000000");
		                    $(this).next("span").removeClass("act");
		                    $(this).next("span").css("color","#ffffff");
		                })
		//                $(window).load(function(){
		//                    var data = [{"src":"${resPath}/fashionPort/images/fs_03.jpg"},{"src":"${resPath}/fashionPort/images/fs_05.jpg"},{"src":"${resPath}/fashionPort/images/fs_07.jpg"},{"src":"${resPath}/fashionPort/images/fs_13.jpg"},{"src":"${resPath}/fashionPort/images/fs_14.jpg"},{"src":"${resPath}/fashionPort/images/fs_14-06.jpg"}];
		//                    $("#load_more").click(function(){
		//                        var lit = $(".container ul");
		//                        for(i in data){
		//                            var box ="";
		//                            if(i==0||i==1||i==2){box = $("<li class='lady'><a href='#'><img src="+data[i].src+"></a></li>");}
		//                            else if(i==3){box = $("<li class='beauty'><a href='#'><img src="+data[i].src+"></a></li>");}
		//                            else if(i==4||i==5){box = $("<li class='man'><a href='#'><img src="+data[i].src+"></a></li>");}
		//                            box.css({"opacity":"0"});
		//                            box.stop().animate({"opacity":"1"},999);
		//                            lit.append(box);
		//                        }
		//                        var hg=$(".container").height();
		//                        hg=hg+680;
		//                        $(".container").height(hg);
		//                    });
		//                })
		            </script>
		
		        </div>
		    </div>
           <decorator:body></decorator:body>
           
			<%-- ========== 底部 ========== --%>
			<%@ include file="./include/footer.jspf"%>
			
			
			
	</body>
</html>