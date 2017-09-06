package com.web.ly;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.ly.OrganizationsServiceLy;
import com.service.ly.SingleProjectServiceLy;
@Controller
@RequestMapping(value="/project")
public class ControllerLy {
	@Autowired
	SingleProjectServiceLy auditingServiceLy;
	@Autowired
	OrganizationsServiceLy OrganizationsServiceLy;
	@RequestMapping(value="/pro")
	public void selaudit(HttpServletResponse response){
		//System.out.println("public________");
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> aList = auditingServiceLy.selectpro();
		JSON json =new JSONArray(aList);
		
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping(value="/orga")
	public void seleOrgas(HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> oList= OrganizationsServiceLy.selecOrgas();
		JSON json = new JSONArray(oList);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping(value="/jects")
	public void selcproject(HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> pList=auditingServiceLy.selprojects();
		JSON json=new JSONArray(pList);
		System.out.println("json----------:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
