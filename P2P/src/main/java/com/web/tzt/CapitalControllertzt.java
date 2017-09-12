package com.web.tzt;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.tzt.Capital;
import com.entity.tzt.Capitaltype;
import com.entity.tzt.Roletable;
import com.service.tzt.CapitalQueryServicetzt;
import com.service.tzt.CapitaltypeServicetzt;

@Controller
@RequestMapping("/capital")
public class CapitalControllertzt {
	
	@Autowired
	CapitaltypeServicetzt  capitaltypeServicetzt;
	@Autowired
	CapitalQueryServicetzt capitalQueryServicetzt;
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
	
	@RequestMapping(value="/queryCapital.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryCapital(@RequestBody Capital capital){
		
		return capitalQueryServicetzt.queryCapital(capital);
	}
	
}
