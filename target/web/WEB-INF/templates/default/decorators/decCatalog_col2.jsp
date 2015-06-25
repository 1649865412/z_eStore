<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>
			时尚港，源自香港的时尚设计师品牌电商
		</title>
		<%--<%@ include file="./include/meta.jspf"%>
		<%@ include file="./include/styles3.jspf"%>
		<%@ include file="./include/styles4.jspf"%>--%>
		<%@ include file="./include/javascripts3.jspf"%>
		
		 <%@ include file="./include/styleCommon.jspf"%>
    	
    	<script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

    <script src="${resPath }/fashionPort/js/jquery.jcarousel.min.js" type="text/javascript"></script>
    	
		<decorator:head />


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
	
	<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.onload" writeEntireProperty="true"/> <decorator:getProperty property="body.onunload" writeEntireProperty="true"/>>
	
			<%-- ========== 横幅信息 ========= --%>
		    <jsp:include flush="true" page="/content/indexMsg.html">
		    	<jsp:param name="status" value="1" />
			</jsp:include>
	
			<%-- ========== 头部 ========= --%>
		    <%@ include file="./include/header.jspf"%>
			
			<%-- ========== 菜单 ========= --%>
			<%@ include file="../pages/menu/defaultTopMenu.jsp"%>
			
    <div class="banner">
        <div class="banner-in">
        	<content:showIndexAd adPositionType="${code}" />
        </div>
    </div>
    
    <div class="blank20">
    </div>
    
    <form action="${category.url}" method="get" id="productListForm">
    	<div class="pag_body">
    		<div class="ssh_list fl">
    			<input type="hidden" id="attributeId" name="attributeName" value=""/>
    			<input type="hidden" id="sizeCode" name=""/>
    			<attribute:attribute var="attribute" attributeCode="chosen"></attribute:attribute>
	            <div class="lit_t" id="ckt_0">
	                <a href="javascript:;" onclick="clickTo(0)">精选</a>
	            </div>
	             <ul class="lit_ul" style="display: none;">
	             <c:forTokens items="${attribute.defaultValue}" delims="," var="conditionValue">
	             	<li>
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'chosen','${ctxPath}/chosen_catalog.html')">${conditionValue}</a>
	             	</li>
				</c:forTokens>
	             </ul>
	             
	             <attribute:attribute var="attribute" attributeCode="new"></attribute:attribute>
	            <div class="lit_t" id="ckt_1">
	                <a href="javascript:;" onclick="clickTo(1)">最新上架</a>
	            </div>
	             <ul class="lit_ul" style="display: none;">
	             <c:forTokens items="${attribute.defaultValue}" delims="," var="conditionValue">
	             	<li>
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'new','${ctxPath}/new-arrivals_catalog.html','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
	             	</li>
				</c:forTokens>
	             </ul>
	             
	             <attribute:attribute var="attribute" attributeCode="lady"></attribute:attribute>
	            <div class="lit_t" id="ckt_2">
	                <a href="javascript:;" onclick="clickTo(2)">女士</a>
	            </div>
	             <ul class="lit_ul" style="display: none;">
	             <c:forTokens items="${attribute.defaultValue}" delims="," var="conditionValue">
	             	<li>
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'lady','${ctxPath}/lady_catalog.html','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
	             	</li>
				</c:forTokens>
	             </ul>
	             
	             <attribute:attribute var="attribute" attributeCode="man"></attribute:attribute>
	            <div class="lit_t" id="ckt_3">
	                <a href="javascript:;" onclick="clickTo(3)">男士</a>
	            </div>
	             <ul class="lit_ul" style="display: none;">
	             <c:forTokens items="${attribute.defaultValue}" delims="," var="conditionValue">
	             	<li>
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'man','${ctxPath}/man_catalog.html','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
	             	</li>
				</c:forTokens>
	             </ul>
	             
	             <%--<attribute:attribute var="attribute" attributeCode="beauty"></attribute:attribute>
	            <div class="lit_t" id="ckt_3">
	                <a href="javascript:;" onclick="clickTo(4)">美妆</a>
	            </div>
	             <ul class="lit_ul" style="display: none;">
	             <c:forTokens items="${attribute.defaultValue}" delims="," var="conditionValue">
	             	<li>
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'beauty','${ctxPath}/beauty_catalog.html')">${conditionValue}</a>
	             	</li>
				</c:forTokens>
	             </ul>--%>
	          
            <script type="text/javascript">
            $(function(){
                //
                var m=$(".ssh_list").find("ul");
                clickTo=function(op){
                    for(var i=0;i<m.length;i++){
                        if(op==i){
                            $("#ckt_"+op).next("ul").slideToggle(300);
                            $("#ckt_"+op).toggleClass("active");
                        }
                        else{
                            $("#ckt_"+i).next("ul").slideUp(300);
                            $("#ckt_"+i).removeClass("active");
                        }
                    }
                    var cd=$("#ckt_"+op).next().find("dl");
                    click_Child=function(child){
                        for(var j=0;j<cd.length;j++){
                            if(child==j){
                                $("#CLD_"+child).find("a").next("dl").slideToggle(300);
                                $("#CLD_"+child).toggleClass("active");
                            }
                            else{
                                $("#CLD_"+j).find("a").next("dl").slideUp(300);
                                $("#CLD_"+j).removeClass("active");
                            }
                        }
                    }
                }               
                if("${category.code}".indexOf('chosen') > -1){
                    clickTo(0);
                }else  if("${category.code}".indexOf('new') > -1){
                    clickTo(1);
                }else  if("${category.code}".indexOf('lady') > -1){
                    clickTo(2);
                }else  if("${category.code}".indexOf('man') > -1){
                    clickTo(3);
                }else  if("${category.code}".indexOf('beauty') > -1){
                    clickTo(4);
                }
            });

            function searchProductList(obj, code,url, sizeCode){
                var $attribute = $("#attributeId");
                $attribute.attr("name",code);
                $attribute.val($(obj).text());
                if(sizeCode != ''){
                	$("#sizeCode").attr("name","sizeCode");
                    $("#sizeCode").val(sizeCode);
                }
                $("#productListForm").attr("action",url);
            	$("#productListForm").submit();
            }

            </script>

        </div>
    		<%-- ========== 内容 ========== --%>
    		<div class="ssh_right fr">
		        	<%@ include file="../pages/catalog/include/productSort.jspf"%>
		        	<decorator:body></decorator:body>
        </div>
           
     </div>
     </form>  
     
    <%-- ========== 底部 ========== --%>
	<%@ include file="./include/footer.jspf"%>
			
        
        

          
	</body>
</html>