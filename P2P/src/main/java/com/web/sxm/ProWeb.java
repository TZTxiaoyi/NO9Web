package com.web.sxm;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.sxm.ProService;
@Controller
@RequestMapping("/pro")
public class ProWeb {
	@Autowired
	ProService pService;
	@RequestMapping(value="/selectPro.do")
	public void selectPro(HttpServletResponse response){
		System.out.println(111);
		List<Object> pList =pService.selectProject();
		JSON json=new JSONArray(pList);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(json.toString());
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
