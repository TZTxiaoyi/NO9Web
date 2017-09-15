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
	/**
	 * 保存更新项目回报
	 */
	@RequestMapping("/SaveReturn")
	@ResponseBody
	public String SaveReturn(@RequestBody String str){
		System.out.println("wer:"+str);
		JSON json=JSONObject.parseObject(str);
		Map map =(Map)json;
		String suc=returnservice.SaveReturn(map);
		return suc;
		
		
	}
	/**
	 * 删除项目回报项
	 */
	@RequestMapping("/DelectReturn")
	public String DeleteReturn(@RequestBody ReturnLjl returnljl){
		returnservice.DeleteReturn(returnljl );
		return "";
		
	}
	/**
	 * 查询项目回报
	 */
	@RequestMapping("/AllReturn")
	@ResponseBody
	public Map AllReturn(@RequestBody ReturnLjl returnljl){
		Map map=returnservice.AllReturn(returnljl);
		System.out.println(map);
		return map;
		
		
	}
	/**
	 * 提交项目审核
	 */
	@RequestMapping("/SExamine")
	@ResponseBody
	public String SExamine(@RequestBody ProjectsLjl projectsljl){
		String str=returnservice.SExamine(projectsljl);
		return str;
	}
}
