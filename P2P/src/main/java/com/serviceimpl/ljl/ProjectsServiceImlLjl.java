package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.ljl.IndetailProjectsDaoLjl;
import com.dao.ljl.ProjectsDaoLjl;
import com.dao.ljl.ReturnProjectsDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.service.ljl.ProjectsServiceLjl;
@Service
public class ProjectsServiceImlLjl implements ProjectsServiceLjl{
	@Autowired
	ProjectsDaoLjl projectsdaoljl;
	@Autowired
	IndetailProjectsDaoLjl IndetailDao;
	/**
	 * 查询用户发起的项目
	 * 
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String AllProjects(UserLjl user) {
		// TODO Auto-generated method stub
		List list=projectsdaoljl.AllProjects(user);
		String  json = JSONObject.toJSONString(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 用户发起项目初始化项目所用表
	 * 
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String SaveProjects(ProjectsLjl proLjl){
		List lists=projectsdaoljl.countProjects(proLjl);
		if(lists.size()>=1){
			return "err1";
			
		}
		int proflag=projectsdaoljl.SaveProjects(proLjl);
		int Projectsid =proLjl.getProjectsid();
		Map map=new HashMap();
		map.put("projectsid",Projectsid);
		System.out.println(map);
		int perflag=projectsdaoljl.SavePersonalProjects(map);//个人
		//int orgflag=projectsdaoljl.SaveOrganizationsProjects(map);//机构
		int desflag=projectsdaoljl.SaveDescribeProjects(map);//信息
		//int indflag=projectsdaoljl.SaveIndetailProjects(map);//详情
		//int retflag=projectsdaoljl.SaveReturnProjects(map);//回报
		System.out.println(proflag);
		if(proflag==1&perflag==1&desflag==1){
			System.out.println("success");
			return"success";
			
		}
		return"err";
	}
	/**
	 * 查询项目的类型
	 * 
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String AllProjectsType() {
		// TODO Auto-generated method stub
		List list=projectsdaoljl.AllProjectsType();
		JSON json=new JSONArray(list);
		return json.toString();
	}
	/**
	 * 用户删除项目
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String DelProjects(ProjectsLjl proLjl) {
		// TODO Auto-generated method stub
		int flag=projectsdaoljl.DelProjects(proLjl);
		projectsdaoljl.DelPersonal(proLjl);
		projectsdaoljl.DelDescribe(proLjl);
		projectsdaoljl.DelIndetail(proLjl);
		projectsdaoljl.DelReturn(proLjl);
		if(flag==1){
			return "success";
		}
		return "err";
	}
	
}
