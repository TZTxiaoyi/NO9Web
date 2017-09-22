package com.web.tzt;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.ProjectsMoneyinfotzt;
import com.service.tzt.ProjectMoneyServicetzt;
import com.service.tzt.ProjectsServerstzt;

@Controller
@RequestMapping("/projectmoney")
public class ProjectMoneyControllertzt {
	
	@Autowired 
	ProjectMoneyServicetzt projectMoneyServicetzt;
	@Autowired
	ProjectsServerstzt projectsServerstzt;
	
	/**
	 * 方法功能说明：  以项目为单位查询项目的筹资进度
	 * 创建：2017年9月14日 by TZT  
	 * @参数： @param projectsLjl
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/queryProjectMoney.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProjectMoney(@RequestBody ProjectsLjl projectsLjl){
		System.out.println(projectsLjl.getProjectsid());
		String  result = JSON.toJSONStringWithDateFormat(projectMoneyServicetzt.queryProjectMoney(projectsLjl),"yyyy-MM-dd HH:mm:ss");
		System.out.println( result);
		return result;
	}
	
	/**
	 * 方法功能说明：  查询每个项目下的所有订单记录
	 * 创建：2017年9月14日 by TZT  
	 * @参数： @param projectsLjl
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/queryProjectMoneyinfo.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryProjectMoneyinfo(@RequestBody ProjectsLjl projectsLjl){
		System.out.println(projectsLjl.getProjectsid());
		String  result = JSON.toJSONStringWithDateFormat(projectMoneyServicetzt.queryProjectMoneyinfo(projectsLjl),"yyyy-MM-dd HH:mm:ss");
		System.out.println( result);
		return result;
	}
	/**
	 * 方法功能说明：  项目失败
	 * 创建：2017年9月15日 by TZT  
	 * @参数： @param projectsMoneyinfotzt
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/removeProject.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String removeProject(@RequestBody ProjectsMoneyinfotzt projectsMoneyinfotzt){
		System.out.println(projectsMoneyinfotzt.getProjectsid());
		String  result = JSON.toJSONString(projectsServerstzt.RemoveProjects(projectsMoneyinfotzt));
		System.out.println( result);
		return result;
	}
	
	/**
	 * 方法功能说明：  项目成功
	 * 创建：2017年9月15日 by TZT  
	 * @参数： @param projectsMoneyinfotzt
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	@RequestMapping(value="/finshProject.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String finshProject(@RequestBody ProjectsMoneyinfotzt projectsMoneyinfotzt){
		System.out.println(projectsMoneyinfotzt.getProjectsid());
		String  result = JSON.toJSONString(projectsServerstzt.FinshProjects(projectsMoneyinfotzt));
		System.out.println( result);
		return result;
	}
	
	
	@RequestMapping(value="/queryAllProjectAudit.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String finshProject(){
		String  result = JSON.toJSONStringWithDateFormat(projectsServerstzt.queryAllProjectAudit(),"YYYY-MM-dd");
		System.out.println(result);
		return result;
	}
}
