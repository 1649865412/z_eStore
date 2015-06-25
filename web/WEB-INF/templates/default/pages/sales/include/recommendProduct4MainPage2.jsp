<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="sales" tagdir="/WEB-INF/tags/sales"%>
<%@ taglib prefix="system" tagdir="/WEB-INF/tags/system"%>

<c:forEach items="${productList}" var="productItem" varStatus="varStatus">
	<li>
	    <div class="p-1">
	    	<product:productImg product="${productItem}" size="c" category="${category}"/>
	    </div>
	    <div class="p-2">
	        ${productItem.brand.brandName}
	    </div>
	    <div class="p-3">
	        <product:productName product="${productItem}" category="${category}" interceptLength="20"/>
	    </div>
	    <div class="p-4">
	        <product:showPrice productSku="${productItem.defaultProductSku}" viewType="4"/>
	    </div>
	</li>
</c:forEach>


<%--
        <div class="Item_images">
        <product:productImg product="${productItem}" size="c" category="${category}"/>
        </div><!--Item_images-->
        <div class="Item_name"> 
         <p class="text_prod"         
          <product:productName product="${productItem}" category="${category}" interceptLength="20"/>
         </p>
         <br/>
         <p class="text_designer">${productItem.brand.brandName}</p>
         <br/>
         <p class="price"><product:showPrice productSku="${productItem.defaultProductSku}" viewType="4"/></p>
        </div><!--Item_name-->
--%>
