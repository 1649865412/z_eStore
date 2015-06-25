
package com.cartmatic.estoresf.content.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.content.Information;
import com.cartmatic.estore.content.service.InformationManager;
import com.cartmatic.estore.core.controller.GenericStoreFrontController;
import com.cartmatic.estore.core.util.StringUtil;
import com.cartmatic.estore.core.view.AjaxView;

/**
 * 前台"风尚"controller
 */

@Controller
public class InformationFrontController extends GenericStoreFrontController<Information> 
{
	private InformationManager informationManager;

	@Override
	protected void initController() throws Exception {
		// TODO Auto-generated method stub
		this.mgr = this.informationManager;
	}
	
	@RequestMapping("/information_all.html")
	public ModelAndView defaultAction(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView("content/informationList");
		String keyword = request.getParameter("keyword");
		List<Information> list = this.informationManager.getSinceInformation(1, 9, null, keyword);
		mv.addObject("inforList", list);
		mv.addObject("keyword", keyword);
		return mv;
	}
	
	@RequestMapping("/information_page.html")
	public ModelAndView page(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView("content/informationPage");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		String keyword = request.getParameter("keyword");
		List<Information> list = this.informationManager.getSinceInformation(Integer.parseInt(pageNo), Integer.parseInt(pageSize), null, keyword);
		mv.addObject("inforList", list);
		AjaxView av = new AjaxView(response);
		av.setData(list);
		return av;
	}
	
	
	@RequestMapping("/information.html")
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("content/informationForm");
		Information infor = null;
		List<Information> list = null;
		String idStr = request.getParameter("inforId");
		String ss = request.getParameter("ss");
		String keyword = request.getParameter("keyword");
		if(StringUtils.isNotBlank(idStr)){
			infor = this.informationManager.getById(Integer.parseInt(idStr));
			mv.addObject("infor", infor);
		}else{
			list = this.informationManager.getSinceInformation(Integer.parseInt(ss), 1, null, keyword);
			if(list!= null && list.size() == 1)
				mv.addObject("infor", list.get(0));
		}
		mv.addObject("ss", ss);
		List<Information> alsoList = this.informationManager.getSinceInformation(1, 5, null, keyword);
		mv.addObject("alsoList", alsoList);
		List<Information> relativeList = this.informationManager.getHotInformation(1, 5);
		mv.addObject("relativeList", relativeList);
		return mv;
	}
	
	@RequestMapping("/information/praise.html")
	public ModelAndView praise(HttpServletRequest request,HttpServletResponse response) {
		String idStr = request.getParameter("inforId");
		Information infor = this.informationManager.getById(Integer.parseInt(idStr));
		AjaxView av = new AjaxView(response);
		infor.setLikeCount(infor.getLikeCount()==null ? 1 : infor.getLikeCount()+1);
		this.informationManager.save(infor);
		av.setStatus(new Short("1"));
		return av;
	}

	@RequestMapping("/shop.html")
	public ModelAndView shop(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView("content/shopList");
		return mv;
	}
	public InformationManager getInformationManager() {
		return informationManager;
	}

	public void setInformationManager(InformationManager informationManager) {
		this.informationManager = informationManager;
	}

}
