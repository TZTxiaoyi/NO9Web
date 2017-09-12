package com.web.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ljl.ProjectsLjl;
import com.service.sxm.ProjectService;
@Controller 
@RequestMapping("project")
public class ProjectWeb {
	@Autowired
	ProjectService pService;
	@ResponseBody
	@RequestMapping(value="selectProject")
	public List selectProject(@RequestBody ProjectsLjl p){
		
		return pService.selectProject(p);
	}
}
