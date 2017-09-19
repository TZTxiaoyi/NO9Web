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
	/**
	 * 
	    * @Title: selectProject  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  根据项目id查询发起人类型
	    * @param @param p
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	@ResponseBody
	@RequestMapping(value="selectProject")
	public List selectProject(@RequestBody ProjectsLjl p){
		
		return pService.selectProject(p);
	}
}
