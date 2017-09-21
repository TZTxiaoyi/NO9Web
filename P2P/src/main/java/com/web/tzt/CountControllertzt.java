package com.web.tzt;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.service.tzt.CountServertzt;

@Controller
@RequestMapping("/counttzt")
public class CountControllertzt {
	@Autowired
	CountServertzt countservertzt;

	
	@RequestMapping(value="/projectrate.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryCapitaltype(HttpServletResponse response){
		List<Map> result =countservertzt.Projectrate();
		return JSON.toJSONString(result);
	}
	
	@RequestMapping(value="/projcettime.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProjecttime(HttpServletResponse response){
		String result =countservertzt.Projcettime();
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/fit.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryTypeFit(HttpServletResponse response){
		String result =countservertzt.fit();
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/repay.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryRepay(HttpServletResponse response){
		String result =countservertzt.repay();
		System.out.println(result.toLowerCase());
		return result.toLowerCase();
	}
	@RequestMapping(value="/typeFit.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String querytypeFit(HttpServletResponse response){
		String result =countservertzt.typeFit();
		System.out.println(result.toLowerCase());
		return result.toLowerCase();
	}
}
