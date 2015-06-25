
package com.cartmatic.estoresf.content.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.content.IndexMsg;
import com.cartmatic.estore.content.service.IndexMsgManager;
import com.cartmatic.estore.core.controller.GenericStoreFrontController;

/**
 * 前台横幅信息显示controller
 */

@Controller
public class IndexMsgFrontController extends GenericStoreFrontController<IndexMsg> 
{
	private IndexMsgManager indexMsgManager;

	@RequestMapping(value={"/content/indexMsg.html"})
	public ModelAndView listMsg(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = getModelAndView("content/indexMsgList");
		List<IndexMsg> indexMsgList = this.indexMsgManager.getAllMsg(1);
		mv.addObject("indexMsgList", indexMsgList);
		return mv;
	}

	@Override
	protected void initController() throws Exception {
		// TODO Auto-generated method stub
		this.mgr = indexMsgManager;
	}

	public IndexMsgManager getIndexMsgManager() {
		return indexMsgManager;
	}

	public void setIndexMsgManager(IndexMsgManager indexMsgManager) {
		this.indexMsgManager = indexMsgManager;
	}

}
