<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>

 <div class="menu">
     <div class="nav">
         <ul>
			<product:showCategorys displayLevel="1" categoryType="2" displayCategoryCode="top-links" >
					<c:forEach var="categoryTreeItem" items="${categoryTreeItems}" varStatus="ss" end="9">
						<product:showCategoryItem var="rootCat" categoryType="1" categoryCode="${categoryTreeItem.code}"></product:showCategoryItem>
					    <li class="dbn-${ss.index+1 }">
					    <a href="${categoryTreeItem.url}" >${categoryTreeItem.name}</a>
					    <c:choose>
					    
					    	<%--最新上架 --%>
					    	<c:when test="${categoryTreeItem.code == 'new-arrivals'}">
					    		<div class="down_nav" style="display: none;">
			                        <div class="dn_jt">
			                            <div class="jt">
			                            </div>
			                        </div>
			                        <div class="dn_main">
			                            <div class="dn_main_con">
			                                <div class="dn_main_con_tit">
			                                    <div class="mn_lf fl">
			                                        按各类选购
			                                    </div>
			                                    <div class="mn_rg fl">
			                                        编辑特荐菜单
			                                    </div>
			                                </div>
			                                <div class="dn_main_con_body">
			                                    <div class="mn_lf fl">
			                                    	<c:if test="${not empty rootCat.categorys}">
												    	<ul>
												            <c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
													            <li  onmouseover="ShowMn(${ss.index+1})"><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
												    		</c:forEach>
												        </ul>
												    </c:if>
			                                    </div>
			                                    <div class="mn_rg fl ShowMn">
			                                    	<c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
			                                    	 <ul  class="mn_rg_slide-${ss.index+1 }${ss.index==0 ? ' show' : ' hide' }">
			                                    	 	<!-- 新品上架的商品  new_arrival-->       
					                                   <jsp:include flush="true" page="${catItem.url}">
															<jsp:param name="isMenu" value="${catItem.url}" />
															<jsp:param name="doAction" value="defaultAction" />
														</jsp:include>
			                                    	 </ul>
			                                    	</c:forEach>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
					    	</c:when>
					    	
					    	<%--女士 --%>
					    	<c:when test="${categoryTreeItem.code == 'lady'}">
					    		<div class="down_nav rapt-1" style="display: none;">
			                        <div class="dn_jt">
			                            <div class="jt dn-1">
			                            </div>
			                        </div>
			                        <div class="dn_main">
			                            <div class="dn_main_con">
			                                <div class="dn_main_con_tit">
			                                    <div class="mn_lf fl">
			                                        按各类选购
			                                    </div>
			                                    <div class="mn_rg fl">
			                                        编辑特荐菜单
			                                    </div>
			                                </div>
			                                <div class="dn_main_con_body">
			                                    <div class="mn_lf fl">
			                                    	<c:if test="${not empty rootCat.categorys}">
												    	<ul>
												            <c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
													            <li  onmouseover="ShowMn(${ss.index+1})"><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
												    		</c:forEach>
												        </ul>
												    </c:if>
			                                    </div>
			                                    <div class="mn_rg fl ShowMn">
			                                    	<c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
			                                    	 <ul  class="mn_rg_slide-${ss.index+1 }${ss.index==0 ? ' show' : ' hide' }">
			                                    	 	<!-- 新品上架的商品  new_arrival-->       
					                                   <jsp:include flush="true" page="${catItem.url}">
															<jsp:param name="isMenu" value="${catItem.url}" />
															<jsp:param name="doAction" value="defaultAction" />
														</jsp:include>
			                                    	 </ul>
			                                    	</c:forEach>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
					    	</c:when>
					    	
					    	<c:when test="${categoryTreeItem.code == 'man'}">
					    		<div class="down_nav rapt-2" style="display: none;">
			                        <div class="dn_jt">
			                            <div class="jt dn-2">
			                            </div>
			                        </div>
			                        <div class="dn_main">
			                            <div class="dn_main_con">
			                                <div class="dn_main_con_tit">
			                                    <div class="mn_lf fl">
			                                        按各类选购
			                                    </div>
			                                    <div class="mn_rg fl">
			                                        编辑特荐菜单
			                                    </div>
			                                </div>
			                                <div class="dn_main_con_body">
			                                    <div class="mn_lf fl">
			                                    	<c:if test="${not empty rootCat.categorys}">
												    	<ul>
												            <c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
													            <li  onmouseover="ShowMn(${ss.index+1})"><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
												    		</c:forEach>
												        </ul>
												    </c:if>
			                                    </div>
			                                    <div class="mn_rg fl ShowMn">
			                                    	<c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
			                                    	 <ul  class="mn_rg_slide-${ss.index+1 }${ss.index==0 ? ' show' : ' hide' }">
			                                    	 	<!-- 新品上架的商品  new_arrival-->       
					                                   <jsp:include flush="true" page="${catItem.url}">
															<jsp:param name="isMenu" value="${catItem.url}" />
															<jsp:param name="doAction" value="defaultAction" />
														</jsp:include>
			                                    	 </ul>
			                                    	</c:forEach>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
					    	</c:when>
					    	
					    	<%--<c:when test="${categoryTreeItem.code == 'beauty'}">
					    		<div class="down_nav rapt-3" style="display: none;">
			                        <div class="dn_jt">
			                            <div class="jt">
			                            </div>
			                        </div>
			                        <div class="dn_main">
			                            <div class="dn_main_con">
			                                <div class="dn_main_con_tit">
			                                    <div class="mn_lf fl">
			                                        按各类选购
			                                    </div>
			                                    <div class="mn_rg fl">
			                                        编辑特荐菜单
			                                    </div>
			                                </div>
			                                <div class="dn_main_con_body">
			                                    <div class="mn_lf fl">
			                                    	<c:if test="${not empty rootCat.categorys}">
												    	<ul>
												            <c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
													            <li  onmouseover="ShowMn(${ss.index+1})"><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
												    		</c:forEach>
												        </ul>
												    </c:if>
			                                    </div>
			                                    <div class="mn_rg fl ShowMn">
			                                    	<c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
			                                    	 <ul  class="mn_rg_slide-${ss.index+1 }${ss.index==0 ? ' show' : ' hide' }">
			                                    	 	<!-- 新品上架的商品  new_arrival-->       
					                                   <jsp:include flush="true" page="${catItem.url}">
															<jsp:param name="isMenu" value="${catItem.url}" />
															<jsp:param name="doAction" value="defaultAction" />
														</jsp:include>
			                                    	 </ul>
			                                    	</c:forEach>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
					    	</c:when>--%>
					    	
					    	<c:when test="${categoryTreeItem.code == 'chosen'}">
					    		<div class="down_nav rapt-4" style="display: none;">
			                        <div class="dn_jt">
			                            <div class="jt dn-4">
			                            </div>
			                        </div>
			                        <div class="dn_main">
			                            <div class="dn_main_con">
			                                <div class="dn_main_con_tit">
			                                    <div class="mn_lf fl">
			                                        按各类选购
			                                    </div>
			                                    <div class="mn_rg fl">
			                                        编辑特荐菜单
			                                    </div>
			                                </div>
			                                <div class="dn_main_con_body">
			                                    <div class="mn_lf fl">
			                                    	<c:if test="${not empty rootCat.categorys}">
												    	<ul>
												            <c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
													            <li  onmouseover="ShowMn(${ss.index+1})"><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
												    		</c:forEach>
												        </ul>
												    </c:if>
			                                    </div>
			                                    <div class="mn_rg fl ShowMn">
			                                    	<c:forEach items="${rootCat.categorys}" var="catItem" varStatus="ss">
			                                    	 <ul  class="mn_rg_slide-${ss.index+1 }${ss.index==0 ? ' show' : ' hide' }">
			                                    	 	<!-- 新品上架的商品  new_arrival-->       
					                                   <jsp:include flush="true" page="${catItem.url}">
															<jsp:param name="isMenu" value="${catItem.url}" />
															<jsp:param name="doAction" value="defaultAction" />
														</jsp:include>
			                                    	 </ul>
			                                    	</c:forEach>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
					    	</c:when>
					    	
					    	<c:otherwise>
					    	</c:otherwise>
					    </c:choose>
				        </li>
					</c:forEach>
				</product:showCategorys>
		</ul>
	</div>
        <script type="text/javascript">
            $(".nav ul li").hover(
                function(){
                    $(this).find('.down_nav').show();
                },
                function(){
                    $(this).find('.down_nav').hide();
                }
            );
            function ShowMn(num){
                var m=$(".ShowMn").find("ul");
                for(var i=0;i<m.length;i++){
                    var n = i + 1;
                    $(".mn_rg_slide-"+n).removeClass("show").addClass("hide");
                }
                $(".mn_rg_slide-"+num).removeClass("hide").addClass("show");
            }
        </script>
 </div>
    
<%--
<ul>
	<product:showCategorys displayLevel="1" categoryType="2" displayCategoryCode="top-links" >
		<c:forEach var="categoryTreeItem" items="${categoryTreeItems}" end="9">
			<product:showCategoryItem var="rootCat" categoryType="1" categoryCode="${categoryTreeItem.code}"></product:showCategoryItem>
		    <li class="${fn:endsWith(OriginalRequestURL,categoryTreeItem.url)?'selected ':''}${(not empty rootCat.categorys)?'top-mama':''}"><a href="${categoryTreeItem.url}" >${categoryTreeItem.name}</a>
		    <c:if test="${not empty rootCat.categorys}">
		    	<ul>
		            <c:forEach items="${rootCat.categorys}" var="catItem">
			            <li><a href="${catItem.url}" title="<c:out value="${catItem.name}"/>">${catItem.name}</a></li>
		    		</c:forEach>
	                <li style="height:10px; width:188px;"></li>
		        </ul>
		    </c:if>
	        </li>
		    
		</c:forEach>
	</product:showCategorys>
</ul>
--%>