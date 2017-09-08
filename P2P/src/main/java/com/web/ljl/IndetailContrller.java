package com.web.ljl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.service.ljl.IndetailServiceLjl;

@Controller
@RequestMapping("/IndetailContrller")
public class IndetailContrller {
	@Autowired
	IndetailServiceLjl IndetailService;
	@RequestMapping("/UpdateIndetail")
	public void UpdateIndetail(@RequestBody String str){
		JSON json=JSONObject.parseObject(str);
		Map map =(Map)json;
		IndetailService.SvaeText(map);
		System.out.println(map);
		
		
	}
}
