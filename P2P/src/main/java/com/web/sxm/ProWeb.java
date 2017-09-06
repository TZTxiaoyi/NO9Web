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
	    * @Description: ��ѯ��Ŀ��̬��ӡ����ҳ  
	    * @param @return    ����  
	    * @return List    ��������  
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
	    * @Description: �����Ŀ���� 
	    * @param @param c 
	    * @param @param response
	    * @param @return    ����  
	    * @return int    ��������  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/savecomm.do")
	public int savecomm(@RequestBody Commentary c,HttpServletResponse response){
		System.out.println("00000");
		return cService.saveComm(c);
	}
}
