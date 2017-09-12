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
	@ResponseBody
	@RequestMapping(value="/selectcomm.do")
	public List selectcomm(){
		List list=cService.selectComm();
		return list;
	}
}
