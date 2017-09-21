package com.web.zb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.zb.ZbProjects;
import com.service.zb.ZbProjectsService;

/**
 * 
 * @ClassName:  ZbProjectsController   
 * @Description:TODO(kong zhi ceng)   
 * @author: 朱彬
 * @date:   2017年9月15日 上午10:21:16   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class ZbProjectsController {
	@Autowired
	ZbProjectsService zbService;
	/**
	 * 
	* @Title: queryZbProjects
	* @Description: TODO(查询项目的方法)
	* @param @return    设定文件
	* @return String    返回类型
	* @throws
	 */
	@RequestMapping("/queryZbProjects.do")
	@ResponseBody
	public List queryZbProjects(){
		System.out.println("-----------");
		List<ZbProjects> projects = (List<ZbProjects>) zbService.queryZbProjects();
		System.out.println("---------projects-----------"+projects.size());
		System.out.println(projects);
		
		return projects;
	}
}
