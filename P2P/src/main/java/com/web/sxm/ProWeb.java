package com.web.sxm;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.sxm.Commentary;
import com.entity.sxm.Pro;
import com.service.sxm.CommService;
import com.service.sxm.ProService;
@Controller
@RequestMapping("/pro")
public class ProWeb {
	@Autowired
	ProService pService;
	@Autowired
	CommService cService;
	
	/**
	 * 
	    * @Title: selectPro  
	    * @Description: 查询项目动态打印到主页  
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@RequestMapping(value="/selectPro.do")
	@ResponseBody
	public List selectPro(@RequestBody Pro p){
		System.out.println("------");
		List<Object> pList =pService.selectProject(p);
		System.out.println(pList);
		//response.setCharacterEncoding("utf-8");
		return pList;

	}
	/**
	 * 
	    * @Title: savecomm  
	    * @Description: 添加项目评论 
	    * @param @param c 
	    * @param @param response
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/savecomm.do")
	public int savecomm(@RequestBody Commentary c,HttpServletResponse response){
		System.out.println("00000");
		return cService.saveComm(c);
	}
}
