
package com.cartmatic.estoresf;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.Constants;
import com.cartmatic.estore.catalog.service.BrandManager;
import com.cartmatic.estore.catalog.service.ProductManager;
import com.cartmatic.estore.common.model.catalog.Brand;
import com.cartmatic.estore.common.model.content.Information;
import com.cartmatic.estore.common.service.SolrService;
import com.cartmatic.estore.content.service.InformationManager;

@Controller
public class MainPageController{
	
	private SolrService solrService = null;
	private ProductManager productManager=null;
	private BrandManager brandManager = null;
	
	private InformationManager informationManager;

	@RequestMapping("/index.html")
	public ModelAndView defaultAction(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		
		ModelAndView mav = new ModelAndView("index");
		List<Brand> brandList=brandManager.findAllBrands();
		mav.addObject("brandList", brandList);
		
		List<Information> brandInforList = this.informationManager.getSinceInformation(1, 4, Constants.INFORMATION_TYPE_BRAND, null);
		List<Information> fashionInforList = this.informationManager.getSinceInformation(1, 1, Constants.INFORMATION_TYPE_FASHION, null);
		List<Information> activityInforList = this.informationManager.getSinceInformation(1, 1, Constants.INFORMATION_TYPE_ACTIVITY, null);
		
		mav.addObject("brandInforList", brandInforList);
		mav.addObject("fashionInforList", fashionInforList);
		mav.addObject("activityInforList", activityInforList);
		
		return mav;
	}
	
	public void setSolrService(SolrService solrService) {
		this.solrService = solrService;
	}
	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}

	public void setBrandManager(BrandManager brandManager) {
		this.brandManager = brandManager;
	}

	public InformationManager getInformationManager() {
		return informationManager;
	}

	public void setInformationManager(InformationManager informationManager) {
		this.informationManager = informationManager;
	}
	
}
