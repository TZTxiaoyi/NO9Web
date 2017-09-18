package com.web.sxm;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.sxm.Commentary;
import com.service.sxm.CommService;
@Controller
@RequestMapping("/comm")
public class CommWeb {
	@Autowired
	CommService cService;
	/**
	 * 
	    * @Title: savecomm  
	    * @Description: 评论插入
	    * @param @param c 
	    * @param @param response
	    * @param @return    
	    * @return int     
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/savecomm.do")
	public int savecomm(@RequestBody Commentary c,HttpServletResponse response){
		return cService.saveComm(c);
	}
	/**
	 * 
	    * @Title: selectcomm  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询评论
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/selectcomm.do")
	public List selectcomm(@RequestBody Commentary c){
		List list=cService.selectComm(c);
		System.out.println("评论"+list);
		return list;
	}
}
