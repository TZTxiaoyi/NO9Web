package com.web.tzt;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.tzt.Capital;
import com.entity.tzt.Capitaltype;
import com.entity.tzt.Orders;
import com.entity.tzt.Roletable;
import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;
import com.service.tzt.CapitalQueryServicetzt;
import com.service.tzt.CapitaltypeServicetzt;
import com.service.tzt.PayServicetzt;

@Controller
@RequestMapping("/capital")
public class CapitalControllertzt {
	
	@Autowired
	CapitaltypeServicetzt  capitaltypeServicetzt;
	@Autowired
	CapitalQueryServicetzt capitalQueryServicetzt;
	@Autowired
	PayServicetzt payServicetzt;
	
	/**
	 * 方法功能说明： 查询资金流向类型 
	 * 创建：2017年9月8日 by TZT  
	 * @参数： @param response
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping("/queryCapitaltype.do")
	@ResponseBody
	public String queryCapitaltype(HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		return capitaltypeServicetzt.queryCapitaltype();
	}
	
	/**
	 * 方法功能说明：  添加一个新的资金流向类型
	 * 创建：2017年9月8日 by TZT  
	 * @参数： @param capitaltype
	 * @参数： @param response
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping("/addCapitaltype.do")
	@ResponseBody
	public String addRoleTable(@RequestBody Capitaltype capitaltype, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		return capitaltypeServicetzt.addCapitaltype(capitaltype);
	}
	
	
	/**
	 * 方法功能说明：  更新项目资金流向类型
	 * 创建：2017年9月8日 by TZT  
	 * @参数： @param capitaltype
	 * @参数： @param response
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping("/updateCapitaltype.do")
	@ResponseBody
	public String updateCapitaltype(@RequestBody Capitaltype capitaltype, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		return capitaltypeServicetzt.updateCapitaltype(capitaltype);
	}
	
	/**
	 * 方法功能说明：  查询平台资金
	 * 创建：2017年9月12日 by TZT  
	 * @参数： @param capital
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/queryCapital.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryCapital(@RequestBody Capital capital){
		
		return capitalQueryServicetzt.queryCapital(capital);
	}
	
	/**
	 * 方法功能说明： 支付功能
	 * 创建：2017年9月12日 by TZT  
	 * @参数： @param orders
	 * @参数： @return    返回JSON类型的 resu  若添加成功返回true失败返回false 
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/payService.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String payService(@RequestBody Orders orders){
		
		Map result =  new HashMap();
		result.put("result", payServicetzt.payService(orders));
		return 		JSON.toJSONString(result);
	}
	
	
}
