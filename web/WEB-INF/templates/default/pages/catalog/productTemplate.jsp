<%--
产品详情页修订版
--%>
<%@ page pageEncoding="utf-8"%>
<%@page import="com.cartmatic.estore.common.model.catalog.ProductReview"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.cartmatic.estore.common.model.catalog.ProductDescription"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="sales" tagdir="/WEB-INF/tags/sales"%>
<%@ taglib prefix="system" tagdir="/WEB-INF/tags/system"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags/app"%>

<c:if test="${product.status != 1}">
	<%response.setStatus(response.SC_GONE);%>
	
</c:if>

<html>
	<head>
		<c:set var="productPrice"><system:CurrencyForRate value="${product.defaultProductSku.price}" /></c:set>
		<c:set value="${empty product.title?product.productName:product.title}" var="pageTitle"></c:set>
		<TITLE>${pageTitle}</TITLE>
		<meta name="keywords" content="<c:out value="${product.metaKeyword}"/>" />
		<meta name="description" content="<c:out value="${empty product.metaDescription ? product.productName : product.metaDescription}"/>" />

      <meta name="baidu-site-verification" content="3PsP8afx3G">
	<link href="${resPath}/fashionPort/css/loginDialog.css" rel="stylesheet" type="text/css" />
	<link href="${resPath }/fashionPort/css/magiczoomplus.css" type="text/css" rel="stylesheet" />
	
	<link href="${resPath }/fashionPort/css/detail.css" rel="stylesheet" type="text/css" />
	<link href="${resPath }/fashionPort/css/main.css" type="text/css" rel="stylesheet" />

<%--<script type="text/javascript" src="${resPath }/fashionPort/js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="${resPath }/fashionPort/js/mzp-packed.js"></script>
      
   </head>
   <body>
	   <div class="pag_body">
	        <div class="pd_main">
	            <div class="pd_lf fl">
	                <div class="box">
	                    <div class="left-pro">
	                        <div class="t1">
	                            <img src="${resPath }/fashionPort/images/gotop.gif" id="gotop" />
	                            <div id="showArea">
	                            	<c:forEach items="${productMoreImages}" var="productMoreImage" varStatus="s">
	                            		<a href="${mediaPath}productMedia/v/${productMoreImage.mediaUrlLarge}" rel="zoom1" rev="${mediaPath}productMedia/v/${productMoreImage.mediaUrlLarge}">
	                            			<cartmatic:img url="${productMoreImage.mediaUrlLarge}" mediaType="productMedia" size="d" alt="" width="100"/>
	                            		</a>
	                            	</c:forEach>
	                            	</div>
	                            <img src="${resPath }/fashionPort/images/gobottom.gif" id="gobottom" />
	                        </div>
	                        <div class="t2">
	                        	<c:forEach items="${productMoreImages}" var="productMoreImage" varStatus="s" end="0">
	                        		<a href="${mediaPath}productMedia/v/${productMoreImage.mediaUrlLarge}" id="zoom1" class="MagicZoom MagicThumb">
		                                <img src="${mediaPath}productMedia/v/${productMoreImage.mediaUrlLarge}" id="main_img" class="main_img" style="width: 410px; height: 422px;" />
		                                <img src="${resPath }/fashionPort/images/img_13.gif" class="fr" />
	                               	</a>
	                        	</c:forEach>
	                        </div>
	                        <div class="t3">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pd_rg fl">
	                <div class="tbox">
	                    <div class="tbx_1">
	                        <a href="${ctxPath }/search-prod.html?brandId=${product.brand.brandId}">${product.brand.brandName}</a> - ${product.productName}
	                        <input type="hidden" id="productId" value="${product.productId}" />
				           <input type="hidden" id="productCode" value="${product.productCode}" />
				           <input type="hidden" id="productName" value="${product.productName}" />
				           <input type="hidden" id="productSkuCode" value="${product.defaultProductSku.productSkuCode}" />
				           <input type="hidden" id="accessoriesSkuCodes" value="" />
				           <input type="hidden" id="categoryId" value="${category.categoryId}" />
				           <input type="hidden" id="product_simpleName" value="<app:interceptString str="${product.productName}" length="50"></app:interceptString>" />
				           <input type="hidden" id="productLinkUrl" value="${uri}" />
				           <input type="hidden" id="listPrice" value="${product.defaultProductSku.listPrice}" />
	                    </div>
	                    <div class="tbx_2">
	                        <%@ include file="./include/productTemplate_priceArea.jspf"%>
	                    </div>
	                    <div class="tbx_3">
	                        <table cellspacing="0" cellpadding="0" class="tab_box">
	                            <tr>
	                                <td id="tab1" class="show" onclick="TabHover(1)">
	                                    <a href="javascript:;">选择购买</a>
	                                </td>
	                                <td id="tab2" class="hide" onclick="TabHover(2)">
	                                    <a href="javascript:;">产品信息</a>
	                                </td>
	                                <td id="tab3" class="hide" onclick="TabHover(3)">
	                                    <a href="javascript:;">产品亮点</a>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="tbx_4">
	                        <div id="tabDiv1" class="block">
	                            <div class="box_buy">
	                            	<div id="skuOptions">
	                            		<div class="tb-prop tm-clear">
							                 <c:forEach items="${productSkuOptionAndValues}" var="productSkuOptionAndValue">
														<c:if test="${fn:indexOf(productSkuOptionAndValue.key.skuOptionCode,'size') > -1}">
															<div class="product_size bbx_1">
																<div class="fl s">
	                                        						尺码：
	                                        					</div>
																<%--文本 --%>
								                                 <ul class="size fl" data-property="${productSkuOptionAndValue.key.skuOptionName}">
																	<c:forEach items="${productSkuOptionAndValue.value}" var="skuOptionValue" varStatus="status">
																		<li data-value="${productSkuOptionAndValue.key.id}:${skuOptionValue.id}" >
																		<a href="#">
																			<span>${skuOptionValue.skuOptionValueName}</span>
																		</a>
																		</li>
											                        </c:forEach>
																</ul>
															</div>
														</c:if>
											</c:forEach>
											<c:forEach items="${productSkuOptionAndValues}" var="productSkuOptionAndValue">
														<c:if test="${fn:indexOf(productSkuOptionAndValue.key.skuOptionCode,'color')>-1}">
															<div class="product_color bbx_2">
																<div class="fl c">
	                                        						颜色：
	                                        					</div>
																<%--图片 --%>
																<ul class="tm-clear J_TSaleProp tb-img fl" data-property="${productSkuOptionAndValue.key.skuOptionName}">
																	<c:forEach items="${productSkuOptionAndValue.value}" var="skuOptionValue" varStatus="status">
																		<!--id="color_${skuOptionValue.skuOptionValue }"-->
																		<li data-value="${productSkuOptionAndValue.key.id}:${skuOptionValue.id}">
																				<a   class="imageSku"  href="#">
																					<span style="display: none;">
																					${skuOptionValue.skuOptionValueName}
																					</span>
																					<!--  background: url(<product:productImg sku="${skuOptionValue.sku}" size="a" isUrlOnly="true"/>) center no-repeat; -->
																					<img src="<product:productImg sku="${skuOptionValue.sku}" size="a" isUrlOnly="true"/>" width="29px" height="29px"/>
																				</a>
																		</li>
											                        </c:forEach>
																</ul>
															</div>
															<div class="blank30">
	                                						</div>
	                                						<div class="blank30">
	                                						</div>
														</c:if>
							                 </c:forEach>
						                 </div>
						           	</div>
	                                
	                                <div class="bbx_3">
	                                    <div class="fl n">
	                                    	 <product:productQuantity2 product="${product}" />
	                                        数量：</div>
	                                    <ul class="fl">
	                                        <li class="d">-</li>
	                                        <li class="line">|</li>
	                                        <li>
	                                            <input id="quantity" name="quantity" value="1" /></li>
	                                        <li class="line">|</li>
	                                        <li class="a">+</li>
	                                    </ul>
	                                    <div class="fl j">
	                                        还剩${maxOrderQuantity == null ? 0 :  maxOrderQuantity}件
	                                    </div>
	                                </div>
	                                <div class="blank30">
	                                </div>
	                                <div class="bbx_4">
	                                    <div class="fl p">
	                                    	<attribute:attributeValue attributeCode="fahuoshijian" attributeValueVar="fahuoshijian" entity="${product}"/>
	                                        付款后 <c:if test="${fahuoshijian.attributeValue == null}">
										             		10
										             	</c:if>
										             	<c:if test="${fahuoshijian.attributeValue != null}">
										             		${fn:substring(fahuoshijian.attributeValue,0,fn:indexOf(fahuoshijian.attributeValue,'天'))}
										             	</c:if>
										             	 个工作日发货
										      <span id="selectedProdMsg"></span>
										 </div>
	                                </div>
	                            </div>
	
	                            <script type="text/javascript">
	                            $(function() {
	                                $(".bbx_1 ul li").click(function() {
	                                    //$(this).addClass("hover").siblings().removeClass("hover");
	                                });
	                                $(".bbx_2 ul li").click(function() {
	                                    //$(this).addClass("hover").siblings().removeClass("hover");
	                                });
	                                $(".bbx_3 ul li.d").click(function() {
	                                    var va = document.getElementById("quantity").value;
	                                    va=va-1;
	                                    if(va>0){
	                                        document.getElementById("quantity").value=va;
	                                    }
	                                    else{
	                                        //alert("数量不能小于");
	                                    }
	                                });
	                                $(".bbx_3 ul li.a").click(function() {
	                                    var va = document.getElementById("quantity").value;
	                                    va=Number(va)+1;
	                                    document.getElementById("quantity").value=va;
	                                });
	                            });
	                            </script>
	
	                        </div>
	                        <div id="tabDiv2" class="none">
	                            <div class="box_info1">
	                                <div class="bbx">
	                                    <table cellpadding="0" cellspacing="0" border="0">
	                                        <tr>
	                                            <td>
	                                                商品编号
	                                            </td>
	                                            <td style="padding-left:25px;">
	                                                ${product.productCode}
	                                            </td>
	                                        </tr>
	                                        <%--<tr><td colspan="2">&nbsp;</td></tr>
	                                        <tr>
	                                            <td>
	                                                设&nbsp;计&nbsp;&nbsp;师
	                                            </td>
	                                            <td style="padding-left:25px;">
	                                                ${product.brand.designer}
	                                            </td>
	                                        </tr>--%>
	                                        <tr><td colspan="2">&nbsp;</td></tr>
	                                        <tr>
	                                            <td valign="top">
	                                                产品细节
	                                            </td>
	                                            <td style="padding-left:25px;">
	                                            	<c:forEach items="${productAttGroups}" var="productAttGroup">
	                                            		<c:if test="${fn:indexOf(productAttGroup.productAttGroupName,'搜索') < 0}">
															<c:forEach items="${productAttGroup.productAttrValues}" var="productAttrValue">
																<c:if test="${productAttrValue.attribute.attributeCode != 'fahuoshijian' && not empty productAttrValue.attributeValue}">
																	<li>${productAttrValue.attribute.attributeName}：
																		<c:choose>
																			<c:when test="${productAttrValue.attributeDataType==1}">
																				${fn:replace(productAttrValue.attributeValue,",","，")}
																			</c:when>
																			<c:otherwise>${productAttrValue.attributeValue}</c:otherwise>
																		</c:choose>
																	</li>
																</c:if>
															</c:forEach>
														</c:if>
													</c:forEach>
	                                            </td>
	                                        </tr>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                        <div id="tabDiv3" class="none">
	                            <div class="box_info2">
	                                <div class="bbx">
	                                    <p>
	                                        <br />
	                                    </p>
	                                    <p>
	                                    	${product.productDescription.shortDescription}
	                                    </p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <script type="text/javascript">
	                function GetID(id) {
	                    return document.getElementById(id);
	                }
	                function TabHover(n) {
	                    for (var i = 1; i <= 3; i++) {
	                        GetID('tab' + i).className = 'hide';
	                        GetID('tabDiv' + i).className = 'none';
	                    }
	                    GetID('tabDiv' + n).className = 'block';
	                    GetID('tab' + n).className = 'show';
	                }
	            </script>
	
	            <div class="blank10">
	            </div>
	            <div class="share_buy">
	            	<div class="sy_1 fl bdsharebuttonbox">
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
													"bdText":"我在时尚港看中了一款产品：${product.productName}，觉得不错，希望小伙伴们能给我出出主意，到底要哪个颜色好呢？中国首家新锐设计师多品牌集成店——时尚港 www.ssgang.com　",
													"bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},
								"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"}
						};
						with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
					</script>
	                <div class="sy_2 fl">
	                     <product:addToCart productSku="${product.defaultProductSku}" checkHandler="checkAddProductToCart" />
	                     <a href="javascript:;" style="margin-left:8px;" onclick="addToFavorite(${product.id});return false;">
	                     	<img src="${resPath }/fashionPort/images/pd_09.jpg" />
	                     </a>
	                </div>
	            </div>
	        </div>
	        <div class="blank130">
	        </div>
	        <div class="pd_box1">
	            <div class="bx_1">
	            </div>
	            <div class="bx_2"><!-- 搭配灵感 -->
	                <ul>
	                	<jsp:include flush="true" page="/sales/recommendedProduct.html">
				             <jsp:param name="typeName" value="accessories" />
				             <jsp:param name="firstResult" value="0" />
				             <jsp:param name="maxResults" value="4" />
				             <jsp:param name="template" value="sales/include/recommendProductContent" />
				             <jsp:param name="doAction" value="defaultAction" />
				             <jsp:param name="sourceId" value="${product.productId}" />
				         </jsp:include>
	                </ul>
	            </div>
	        </div>
	        <div class="blank28">
	        </div>
	        <div class="pd_box2">
	            <div class="bx_1">
	            </div>
	            <div class="bx_2"><!-- 猜你也喜欢 -->
	                <ul>
	                    <jsp:include flush="true" page="/sales/recommendedProduct.html">
				             <jsp:param name="typeName" value="also_buy" />
				             <jsp:param name="firstResult" value="0" />
				             <jsp:param name="maxResults" value="5" />
				             <jsp:param name="template" value="sales/include/recommendProductContent" />
				             <jsp:param name="doAction" value="defaultAction" />
				             <jsp:param name="sourceId" value="${product.productId}" />
				         </jsp:include>
	                </ul>
	            </div>
	        </div>
	        <div class="blank60">
	        </div>
	    </div>
	       
	    <script type="text/javascript" src="${resPath }/fashionPort/js/thumb-img.js"></script>
	        
<script type="text/javascript" src="${ctxPath}/scripts/cartmatic/myaccount/loginDlg.js"></script>
<script type="text/javascript" src="${ctxPath}/scripts/cartmatic/catalog/productDetail.js"></script>
<script type="text/javascript" defer>
var skuWholesalePrices = new Array();
<c:if test="${product.status==1}">
<%--产品价格包括批发价--%>
skuWholesalePrices[0]=[1,"${defaultProductSkuPrice}"];
<c:forEach items="${skuWholesalePrices}" var="wholesalePrice" varStatus="varStatus">
	skuWholesalePrices[${varStatus.count}]=["${wholesalePrice.minQuantity}","${wholesalePrice.price}"];
</c:forEach>
<c:if test="${product.productKind==2}">
var jProduct=${jsonProduct};
$("#skuOptions").children("div.tb-prop").find("li[data-value]").click(function(){
	if($(this).hasClass("tb-out-of-stock")){return false;};
	if($(this).toggleClass("tb-selected").hasClass("tb-selected")){
		$(this).append("<i></i>").siblings("li").removeClass("tb-selected").children("i").remove();
	}else{
		$(this).children("i").remove();
	}
	var selectedOptions=$("#skuOptions").children("div.tb-prop").find("li.tb-selected[data-value]");
	var selectOptions=$("#skuOptions").children("div.tb-prop").find("li[data-value]").not(".tb-selected");
	
	var aOptionValueIds=",";
	var skus=jProduct.productSkus;
	
	for(var i=0;i<selectOptions.length;i++){
		var selectOption=$(selectOptions[i]);
		var optionId=selectOption.attr("data-value").split(":")[0];
		var optionValueId=selectOption.attr("data-value").split(":")[1];
		var hasMatchSku=false;
		var sku=null;
		for (k in skus){
			sku=skus[k];
			var skuOptions=sku.skuOptions;
			var hasOptionValue=false;
			for(j in skuOptions){
				var skuOption=skuOptions[j];
				if(selectOption.attr("data-value")==(skuOption.id+":"+skuOption.vid)){
					hasOptionValue=true;
					break;
				}
			}
			if(hasOptionValue){
				hasMatchSku=true;
			}else{
				continue;
			}
			for(var j=0;j<selectedOptions.length;j++){
				var selectedOption=$(selectedOptions[j]);
				var selectedOptionId=selectedOption.attr("data-value").split(":")[0];
				if(optionId!=selectedOptionId){
					hasOptionValue=false;
					for(l in skuOptions){
						var skuOption=skuOptions[l];
						if(selectedOption.attr("data-value")==(skuOption.id+":"+skuOption.vid)){
							hasOptionValue=true;
							break;
						}
					}
					if(!hasOptionValue){
						hasMatchSku=false;
						break;
					}
				}
			}
			if(hasMatchSku){
				break;
			}
		}
		if(hasMatchSku){
			if(aOptionValueIds.indexOf(","+optionValueId+",")==-1){
				aOptionValueIds+=optionValueId+",";
			}
		}
	}
		
	for(var i=0;i<selectOptions.length;i++){
		var option=$(selectOptions.get(i));
		var optionV=option.attr("data-value").split(":");
		if(aOptionValueIds.indexOf(","+optionV[1]+",")==-1){
			option.addClass("tb-out-of-stock");
		}else{
			option.removeClass("tb-out-of-stock");
		}
	}
		
	var selectedSku=null;
	for (i in skus){
		var sku=skus[i];
		var skuOptions=sku.skuOptions;
		var isMatch=false;
		for(j in skuOptions){
			isMatch=false;
			var skuOption=skuOptions[j];
			for(var k=0;k<selectedOptions.length;k++){
				if($(selectedOptions[k]).attr("data-value")==(skuOption.id+":"+skuOption.vid)){
					isMatch=true;
					break;
				}
			}
			if(!isMatch){
				break;
			}
		}
		if(isMatch){
			selectedSku=sku;
			break;
		}
	}
	var add2CartBtn=$("#add2Cart"+${product.id});
	if(selectedSku){
		//更新图片
		$("#productImgA").find("img").attr("src",__mediaPath+"product/d/"+selectedSku.image);
		//价格
		var skuPrice=selectedSku.salePrice!=null?selectedSku.salePrice:selectedSku.discountPrice!=null?selectedSku.discountPrice:selectedSku.price;
		$("#priceSpan").attr("data-value",skuPrice).html(fnFormatPrice(skuPrice));
		$("#priceSpan").next("span[name='otherCurrency']").attr("defaultvalue",skuPrice);
		if(selectedSku.priceViewType==2||selectedSku.priceViewType==3){
			$("#listPriceSpan").html('<del>'+fnFormatPrice(selectedSku.price)+'</del>').show();
			$("#discountPercent").html("("+selectedSku.discountPercent+"% OFF)");
		}else{
			$("#listPriceSpan,#discountCount").hide();
		}
		$("#productSkuCodeSpan").html(selectedSku.productSkuCode);
		$("#productSkuCode").val(selectedSku.productSkuCode);
		$("#productSkuId").val(selectedSku.productSkuId);
		$("#productWeightSpan").attr("data-value",selectedSku.weight+"").html(selectedSku.weight);
		if(!selectedSku.inventory){
			$("#productStockSpan").html("有现货");
			add2CartBtn.removeClass("stock").removeClass("no-addtocart").removeAttr("disabled").attr("title",__FMT.minicart_addToCart).val(__FMT.minicart_addToCart);
		}else if(selectedSku.inventory.availableQuantity>0){
			$("#productStockSpan").html(selectedSku.inventory.availableQuantity+" 件");
			add2CartBtn.removeClass("stock").removeClass("no-addtocart").removeAttr("disabled").attr("title",__FMT.minicart_addToCart).val(__FMT.minicart_addToCart);
		}else{
			$("#productStockSpan").html(__FMT.outOfStock);
			add2CartBtn.addClass("stock").attr("disabled","disabled").attr("title",__FMT.outOfStock).val(__FMT.outOfStock);
		}
		
		$("#skuWholesalePriceTbl").find("tr").slice(1).remove();
		skuWholesalePrices=selectedSku.wholesalePrices.slice(0,selectedSku.wholesalePrices.length);
		skuWholesalePrices.unshift([1,skuPrice]);
		$("#skuWholesalePriceTbl").append('<tr><td>1-1</td><td>'+fnFormatPrice(skuPrice)+'<span defaultvalue="'+skuPrice+'" name="otherCurrency"></span></td></tr>');
		for(var i=1;i<skuWholesalePrices.length;i++){
			var ws_qty=skuWholesalePrices[i][0]+"+";
			if(i<skuWholesalePrices.length-1){
				ws_qty=skuWholesalePrices[i][0]+"-"+(skuWholesalePrices[i+1][0]-1);
			}
			$("#skuWholesalePriceTbl").append('<tr><td>'+ws_qty+'</td><td>'+fnFormatPrice(skuWholesalePrices[i][1])+'<span defaultvalue="'+skuWholesalePrices[i][1]+'" name="otherCurrency"></span></td></tr>');
		}
		fnChangePrice();
	}else{
		add2CartBtn.removeClass("stock").addClass("no-addtocart").removeAttr("disabled").val(__FMT.minicart_addToCart);
	}
	
	var skuOptions=$("#skuOptions").children("div.tb-prop").find("li.tb-selected");
	var name="";
	skuOptions.each(function(i){
		if($(this).find("span").length!=0){
			name+=$(this).find("span").text();
		}
	});
	var msg="";
	if(name!=""){
		msg="（已选："+name + "）";
		if(selectedSku&&((!selectedSku.inventory)||selectedSku.inventory.availableQuantity>0)){
			msg+='&nbsp;&nbsp;<span class="mark_co">现在有货</span>';
		}
	}
	$("#selectedProdMsg").html(msg);
	return false;
});

function checkAddProductToCart(){
	var skuOptions=$("#skuOptions").children("div.tb-prop").find("ul[data-property]");
	var name="";
	skuOptions.each(function(i){
		if($(this).find("li.tb-selected").length==0){
			name+="."+$(this).attr("data-property");
		}
	});
	if(name!=""){
		alert("请选择 "+name);
	}
	return name=="";
}
</c:if>
</c:if>

//图片lightbox,稳定好移到js
function showLightbox(){
	var lightbox=$("#lightbox");
	var left=Math.round((($(document).width()||$(window).width())-lightbox.width())/2);
	var top=Math.round($("html").scrollTop()+($(window).height()-lightbox.height())/2);
	if(top<0)top=0;
	$("#lightboxOverlay").show();
	lightbox.css({ top: top, left: left }).show();
}

$("#lb-close,#lightboxOverlay").click(function(){
	$("#lightbox").hide();
	$("#lightboxOverlay").hide();
});
$("#lb-thumbnailContent").children().click(function(){
	$(this).addClass("selected").siblings().removeClass("selected");
	$("#lb-image").attr("src",__resPath+"/images/img/empty.gif");
	$("#lb-image").attr("src",__resPath+"/images/img/empty.gif").attr("src",$(this).children("img").attr("src").replace("/a/","/v/"));
});
$("#lb-previous").click(function(){
	$("#lb-thumbnailContent").children(".selected").prev().click();
});
$("#lb-next").click(function(){
	$("#lb-thumbnailContent").children(".selected").next().click();
});
$("a[target='popup_larger_image']").click(function(){
	var thumbImgUrl=$("#imgContent").children(".selected").children("img").attr("src");
	$("#lb-thumbnailContent").find("img[src='"+thumbImgUrl+"']").parent().click();
	showLightbox();
	return false;
});
</script>

<%--购物车弹出层 begin --%>
<textarea id="shoppingCartTemplate" style="display: none;">
	<h2>
		已将{0}件商品加入购物车！
	</h2>
	<div class="left">
		<div class="wrap-line">
			<div class="photo">
				<img src="${appConfig.store.mediaUrlPath}/product/e/{1}" width="165" height="165" alt="" onerror="$(this).attr('originsrc',this.src).attr('src',__defaultImage).removeAttr('onerror');" originsrc=""/>
			</div>
			<div class="txt">
				{2}
				<div class="blank10"></div>
				<strong class="red f13px">{3}</strong>
				<br>
					<strong class="f13px">数量:{4}</strong>
			</div>
		</div>
	</div>
	<div class="right">
		{5}件商品在您的购物车内
		<br>
		<strong class="f18px">小计: <span class="red">{6}</span>
		</strong>
		<div class="out">
			<button class="toggle1 checkout" title="CheckOut" type="button"
				value="CheckOut"
				onclick="window.location.href='/cart/shoppingcart.html'">
				去结算
			</button>
		</div>
		<div class="shop">
			<a onclick="closeSimpleDialog('shoppingcartAlertWId_');return false;" href="#" style="text-decoration: none;">继续购物</a>
		</div>
	</div>
</textarea>
<%--购物车弹出层 end --%>
<%--收藏夹弹出层 begin --%>
<div id="favoriteTemplate" style="display: none;">
	<h2>
		{0}
	</h2>
	<a href="/myaccount/favorites.html">您可以 查看收藏夹</a>
</div>
<%--收藏夹弹出层 end --%>
	    
	   
   </body>
</html>