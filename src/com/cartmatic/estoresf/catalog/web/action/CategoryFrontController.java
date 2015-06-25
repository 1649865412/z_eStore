package com.cartmatic.estoresf.catalog.web.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cartmatic.estore.catalog.service.CategoryManager;
import com.cartmatic.estore.catalog.service.ProductManager;
import com.cartmatic.estore.common.helper.CatalogHelper;
import com.cartmatic.estore.common.helper.ConfigUtil;
import com.cartmatic.estore.common.model.catalog.Category;
import com.cartmatic.estore.common.model.catalog.CategoryTreeItem;
import com.cartmatic.estore.common.model.catalog.Product;
import com.cartmatic.estore.common.model.system.Store;
import com.cartmatic.estore.common.service.SolrService;
import com.cartmatic.estore.core.controller.GenericStoreFrontController;
import com.cartmatic.estore.core.util.StringUtil;
import com.cartmatic.estore.core.view.RedirectView301;
import com.cartmatic.estore.textsearch.model.SearchResult;
import com.cartmatic.estoresf.webapp.wrapper.RemoveParamWrapper;

@Controller
public class CategoryFrontController extends GenericStoreFrontController<Category> {

	private ProductManager	productManager	= null;
	private CategoryManager	categoryManager	= null;
	private SolrService solr = null;
	@Override
	protected void initController() throws Exception {
		// TODO Auto-generated method stub
		mgr = categoryManager;
		setCacheSecondsConfigurable(true);
	}
	
	private ModelAndView getNotFoundView(){
		return getModelAndView("catalog/categoryErrorPage");
	}

	@RequestMapping(value={"/**/*_catalog.html","/**/*_catalog_pn*.html"})
	public ModelAndView defaultAction(HttpServletRequest request,HttpServletResponse response) {
		
		String isMenu = request.getParameter("isMenu");
		String uri = null;
		if(!StringUtil.isEmpty(isMenu)){
//			System.out.println("isMenu : " + isMenu);
			uri = isMenu;
		}else{
			uri=request.getRequestURI();
		}
		if(uri.contains("/aboutus/help")){
			return new ModelAndView(new RedirectView("/customer_service/_16.html"));
		}
		Store store=ConfigUtil.getInstance().getStore();
		
		CatalogHelper catalogHelper=CatalogHelper.getInstance();
		//CategoryTreeItem继承category
		CategoryTreeItem category=(CategoryTreeItem)catalogHelper.getProductCategoryByUri(uri);
		if(category==null){
			return getNotFoundView();
		}
		//检查请求的URI内的目录名称是否正确，不正确的重定向到正确的URI
		String categoryUri=category.getUrl();
		try {
			String start_categoryUri=categoryUri.substring(0,categoryUri.lastIndexOf("/")+1);
			String start_uri=uri.substring(0,uri.lastIndexOf("/")+1);
			String end_uri=uri.substring(uri.lastIndexOf("/")+1);
			if(!URLDecoder.decode(start_uri, "UTF-8").equals(start_categoryUri)){
				return new ModelAndView(new RedirectView301(start_categoryUri+end_uri));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		List<Category> navigatorCategorys=category.getNavigatorCategorys();
		
		
		String defaultMv= "";
		String mv = "";
		if(StringUtil.isEmpty(isMenu)){
			defaultMv = "/catalog/categoryTemplate";
			mv = this.getTemplatePath(defaultMv, category.getTemplatePath());
		}else{
			defaultMv = "/sales/include/recommendProduct4MainPage";
			mv = defaultMv;
		}
//		String mv = this.getTemplatePath(defaultMv, category.getTemplatePath());
		
		ModelAndView modelAndView = getModelAndView(mv);
		modelAndView.addObject("category", category);
		modelAndView.addObject("navigatorCategorys", navigatorCategorys);
		
		
		//显示该目录的产品
		List<Product> productList= new ArrayList<Product>();
		SearchResult searchResult = null;
		if(StringUtil.isEmpty(isMenu)){
			searchResult = solr.queryProductByCatalog(request, category.getCategoryId(),store.getCategoryListPerSize());
		}else{
			searchResult = solr.queryProductByCatalog(new RemoveParamWrapper(request), category.getCategoryId(), 4);
		}
		
		List<Integer> solrRsp = searchResult.getResultList();
		for (Integer id : solrRsp)
		{
			Product product = productManager.getById(id);
			if(product != null){
				productList.add(product);
			}
		}
		modelAndView.addObject("productList", productList);
		modelAndView.addObject("facetMap", searchResult.getFacetMap());
		modelAndView.addObject("code", category.getCode());
		
		String sizeCode = request.getParameter("sizeCode");
		if(StringUtils.isNotBlank(sizeCode)){
			request.setAttribute("sizeCode", sizeCode);
		}
		return modelAndView;
	}


	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}


	public void setCategoryManager(CategoryManager categoryManager) {
		this.categoryManager = categoryManager;
	}
	
	public void setSolrService(SolrService avalue)
	{
		this.solr = avalue;
	}
}
