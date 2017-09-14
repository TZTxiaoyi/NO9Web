package com.web.ljl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;
import com.service.ljl.ReturnService;

@Controller
@RequestMapping("/ReturnContrller")
public class ReturnContrller {
	@Autowired
	ReturnService returnservice;
	@RequestMapping("/SaveReturn")
	@ResponseBody
	public String SaveReturn(@RequestBody String str){
		System.out.println("wer:"+str);
		JSON json=JSONObject.parseObject(str);
		Map map =(Map)json;
		String suc=returnservice.SaveReturn(map);
		return suc;
		
		
	}
	@RequestMapping("/DelectReturn")
	public String DeleteReturn(@RequestBody ReturnLjl returnljl){
		returnservice.DeleteReturn(returnljl );
		return "";
		
	}
	@RequestMapping("/AllReturn")
	@ResponseBody
	public Map AllReturn(@RequestBody ReturnLjl returnljl){
		Map map=returnservice.AllReturn(returnljl);
		System.out.println(map);
		return map;
		
		
	}
	@RequestMapping("/SExamine")
	@ResponseBody
	public String SExamine(@RequestBody ProjectsLjl projectsljl){
		String str=returnservice.SExamine(projectsljl);
		return str;
	}
}
