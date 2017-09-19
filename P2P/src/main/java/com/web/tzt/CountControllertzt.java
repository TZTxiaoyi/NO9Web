package com.web.tzt;

import java.util.HashMap;
import java.util.List;
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
import com.service.tzt.CapitalQueryServicetzt;
import com.service.tzt.CapitaltypeServicetzt;
import com.service.tzt.CountServertzt;
import com.service.tzt.PayServicetzt;


public class CountControllertzt {
	
	@Autowired
	CountServertzt countservertzt;

	
	@RequestMapping(value="/projectrate.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryCapitaltype(HttpServletResponse response){
		List<Map> result =countservertzt.Projectrate();
		
		
		return null;
	}
		

}
