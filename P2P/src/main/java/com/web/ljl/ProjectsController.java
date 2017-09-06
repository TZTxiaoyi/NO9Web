package com.web.ljl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.ljl.PerProLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.service.ljl.ProjectsServiceLjl;

@Controller
@RequestMapping("/ProjectsController")
public class ProjectsController {
	
	@Autowired
	ProjectsServiceLjl projectsServiceLjl;
	
	@RequestMapping("/AllProjectsType")
	public void AllProjectsType(HttpServletResponse response){
		String str=projectsServiceLjl.AllProjectsType();
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		System.out.println(str);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/AllProjects")
	public String AllProjects(@RequestBody UserLjl user,HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		//System.out.println(user.getEmpid());
		String str= projectsServiceLjl.AllProjects(user);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	@RequestMapping("/SaveProjects")
	public String SaveProjects(ProjectsLjl proLjl,HttpServletRequest request,HttpServletResponse response){
		System.out.println("55");
		String str=projectsServiceLjl.SaveProjects(proLjl);
		int Projectsid= proLjl.getProjectsid();
		//System.out.println(str);
		if (str=="success"){
			//System.out.println("444");
			return "success";
		}
		return "err";
		
	}
	
}
