<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title><decorator:title /></title>
		<%--<%@ include file="./include/meta.jspf"%>
		<%@ include file="./include/styles3.jspf"%>
		<%@ include file="./include/styles4.jspf"%>--%>
		<%@ include file="./include/javascripts3.jspf"%>
		
		<%@ include file="./include/styleCommon.jspf"%>
		
		<link href="${resPath }/fashionPort/css/brand_product.css" rel="stylesheet"/>
    	
    	<script src="${resPath }/fashionPort/js/jquery.flexslider-min.js" type="text/javascript"></script>

   		 <script src="${resPath }/fashionPort/js/jquery.jcarousel.min.js" type="text/javascript"></script>	
		
		<decorator:head />
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
        	<c:if test="${brand != null}">
        		<div id="focus">
	                <ul>
	                    <li>
	                        <div class="text">
	                            <p class="p-1">${brand.brandName }</p>
	                            <p class="p-2">${brand.story}</p>
	                            <%--<p class="p-3"><a href="#">注册并关注111SKIN新品讯息--%></a></p>
	                        </div>
	                        <div class="brandPic">
	                        	<cartmatic:img url="${brand.pic2}" mediaType="other"></cartmatic:img>
	                        </div>
	                    </li>
	                </ul>
	                <div class="btn">
	                    <span class=""></span>
	                </div>
	            </div>
        	</c:if>
        	<c:if test="${brand == null}">
        		<content:showAd adPositionType="searchAd" />
        	</c:if>
        </div>
    </div>
    <div class="blank20">
    </div>
    
    <form action="${ctxPath}/search-prod.html" method="get" id="productListForm">
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
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'chosen')">${conditionValue}</a>
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
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'new','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
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
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'lady','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
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
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'man','${fn:indexOf(conditionValue,'鞋履') > -1 ? 'shoe' : (fn:indexOf(conditionValue,'服饰') > -1 ? 'dress' : '') }')">${conditionValue}</a>
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
	             		<a href="javascript:void(0)" onclick="searchProductList(this,'beauty')">${conditionValue}</a>
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
                //debugger;
                if("${chosen}".indexOf('chosen') > -1){
                    clickTo(0);
                }else  if("${new}".indexOf('new') > -1){
                    clickTo(1);
                }else  if("${lady}".indexOf('lady') > -1){
                    clickTo(2);
                }else  if("${man}".indexOf('man') > -1){
                    clickTo(3);
                }else  if("${beauty}".indexOf('beauty') > -1){
                    clickTo(4);
                }        
            });

            function searchProductList(obj, code, sizeCode){
                var $attribute = $("#attributeId");
                $attribute.attr("name",code);
                $attribute.val($(obj).text());
                if(sizeCode != ''){
                	$("#sizeCode").attr("name","sizeCode");
                    $("#sizeCode").val(sizeCode);
                }
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