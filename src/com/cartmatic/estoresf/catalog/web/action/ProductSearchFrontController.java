package com.cartmatic.estoresf.catalog.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.Constants;
import com.cartmatic.estore.catalog.service.BrandManager;
import com.cartmatic.estore.catalog.service.ProductManager;
import com.cartmatic.estore.common.helper.CatalogHelper;
import com.cartmatic.estore.common.helper.ConfigUtil;
import com.cartmatic.estore.common.model.catalog.Brand;
import com.cartmatic.estore.common.model.catalog.Category;
import com.cartmatic.estore.common.model.catalog.Product;
import com.cartmatic.estore.common.model.system.Store;
import com.cartmatic.estore.common.service.SolrService;
import com.cartmatic.estore.core.controller.GenericStoreFrontController;
import com.cartmatic.estore.textsearch.model.SearchResult;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class ProductSearchFrontController extends GenericStoreFrontController<Product> {
	private ProductManager productManager = null;
	@Autowired
	private BrandManager brandManager=null;
	private SolrService solr = null;

	@Override
	protected void initController() throws Exception {
		// TODO Auto-generated method stub
		mgr = productManager;
	}

	@Override
    @RequestMapping(value="/search-prod.html")
	public ModelAndView defaultAction(HttpServletRequest request, HttpServletResponse response) {
		Store store=ConfigUtil.getInstance().getStore();
		ModelAndView mv = getModelAndView("catalog/searchProductList");
		List<Product> results = new ArrayList<Product>();
		Map<String,String> params = request.getParameterMap();
		for(Map.Entry<String, String> entry : params.entrySet()){
			request.setAttribute(entry.getKey(),entry.getKey());
		}
		SearchResult searchResult = solr.queryProductBySearch(request,store.getCategoryListPerSize());
		List<Integer> ids = (List<Integer>)searchResult.getResultList();
		for (Integer id : ids)
		{
			Product product=productManager.getById(id);
			if(product!=null)
				results.add(product);
		}
		mv.addObject("facetMap", searchResult.getFacetMap());
		mv.addObject("productList", results);
		Integer cat=ServletRequestUtils.getIntParameter(request, "cat", ConfigUtil.getInstance().getStore().getCatalog().getCategoryId());
		Category searcheCategory=CatalogHelper.getInstance().getCategoryById4Front(Constants.CATEGORY_TYPE_CATALOG, cat);
		mv.addObject("category", searcheCategory);
		request.setAttribute("category", searcheCategory);
		Integer brandId=(Integer)request.getAttribute("brandId");
		if(brandId!=null){
			Brand brand=brandManager.getById(brandId);
			request.setAttribute("brand", brand);
		}
		String sizeCode = request.getParameter("sizeCode");
		if(StringUtils.isNotBlank(sizeCode)){
			request.setAttribute("sizeCode", sizeCode);
		}
		return mv;
	}

	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}
	public void setSolrService(SolrService avalue)
	{
		this.solr = avalue;
	}
}
