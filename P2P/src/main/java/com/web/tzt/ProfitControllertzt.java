package com.web.tzt;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.tzt.Profit;
import com.service.tzt.ProfitServicetzt;

@Controller
@RequestMapping("/profit")
public class ProfitControllertzt {

	@Autowired
	ProfitServicetzt profitServicetzt;
	
	
	/**
	 * 方法功能说明：  查询盈利资金流水记录
	 * 创建：2017年9月21日 by TZT  
	 * @参数： @param profit
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/queryProfit.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProfit(@RequestBody Profit profit){
		String result = JSON.toJSONStringWithDateFormat(profitServicetzt.queryProfit(profit),"yyyy-MM-dd HH:mm:ss");
		System.out.println(result);
		return result;
	}
	
	/**
	 * 方法功能说明：  增加一笔收入或者支出
	 * 创建：2017年9月21日 by TZT  
	 * @参数： @param profit
	 * @参数： @param request
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/addProfit.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addProfit(@RequestBody Profit profit,HttpServletRequest request){
		Map result=new HashMap();
		System.out.println(request.getSession().getAttribute("empid").getClass());
		profit.setOperator(String.valueOf(request.getSession().getAttribute("empid")));
		System.out.println(JSON.toJSONString(profit));
	    if(profitServicetzt.addProfit(profit)!=0){
	    	result.put("result",true);
	    }
		return JSON.toJSONString(result);
	}
}
