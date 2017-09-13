package com.web.tzt;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.ljl.ProjectsLjl;
import com.service.tzt.ProjectMoneyServicetzt;

@Controller
@RequestMapping("/projectmoney")
public class ProjectMoneyControllertzt {
	
	@Autowired 
	ProjectMoneyServicetzt projectMoneyServicetzt;
	
	@RequestMapping(value="/queryProjectMoney.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProjectMoney(ProjectsLjl projectsLjl){
		
		String  result = JSON.toJSONString(projectMoneyServicetzt.queryProjectMoney(projectsLjl));
		System.out.println( result);
		return result;
	}
	
	@RequestMapping(value="/queryProjectMoneyinfo.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProjectMoneyinfo(ProjectsLjl projectsLjl){
		System.out.println(projectsLjl.getProjectsid());
		String  result = JSON.toJSONString(projectMoneyServicetzt.queryProjectMoneyinfo(projectsLjl));
		System.out.println( result);
		return result;
	}
	
}
