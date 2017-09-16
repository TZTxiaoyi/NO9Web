package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ljl.ReturnLjl;
import com.entity.sxm.ProBack;
import com.service.sxm.ProReturnService;
@Controller
@RequestMapping("/return")
public class ProReturnWeb {
	@Autowired
	ProReturnService prs;
	/**
	 * 
	    * @Title: selectProReturn  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询回报项目
	    * @param @param r
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectProReturn.do")
	public List selectProReturn(@RequestBody ReturnLjl  r){
		
		System.out.println("回报"+prs.selectProReturn(r));
		return prs.selectProReturn(r);
	}
	/**
	 * 
	    * @Title: insertProBack  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  插入回报项目
	    * @param @param pBack
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/insertProBack.do")
	public int insertProBack(@RequestBody ProBack pBack){
		System.out.println("----fffffff-----------");
		System.out.println("回报记录"+pBack.getAddressid()+","+pBack.getSponsor_id());
		System.out.println(pBack.getSupport_id()+","+pBack.getLogistics());
		return prs.insertProBack(pBack);
	}
}
