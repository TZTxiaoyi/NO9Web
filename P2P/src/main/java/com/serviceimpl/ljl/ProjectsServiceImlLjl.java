package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.ljl.ProjectsDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.service.ljl.ProjectsServiceLjl;
@Service
public class ProjectsServiceImlLjl implements ProjectsServiceLjl{
	@Autowired
	ProjectsDaoLjl projectsdaoljl;
	@Override
	public String AllProjects(UserLjl user) {
		// TODO Auto-generated method stub
		List list=projectsdaoljl.AllProjects(user);
		String  json = JSONObject.toJSONString(list);
		System.out.println(json);
		return json;
	}
	@Override
	public String SaveProjects(ProjectsLjl proLjl){
		
		int proflag=projectsdaoljl.SaveProjects(proLjl);
		int Projectsid =proLjl.getProjectsid();
		Map map=new HashMap();
		map.put("projectsid",Projectsid);
		System.out.println(map);
		int perflag=projectsdaoljl.SavePersonalProjects(map);//个人
		//int orgflag=projectsdaoljl.SaveOrganizationsProjects(map);//机构
		int desflag=projectsdaoljl.SaveDescribeProjects(map);//信息
		int indflag=projectsdaoljl.SaveIndetailProjects(map);//详情
		int retflag=projectsdaoljl.SaveReturnProjects(map);//回报
		System.out.println(proflag);
		if(proflag==1&perflag==1&desflag==1&indflag==1&retflag==1){
			System.out.println("success");
			return"success";
			
		}
		return"err";
	}
	@Override
	public String AllProjectsType() {
		// TODO Auto-generated method stub
		List list=projectsdaoljl.AllProjectsType();
		JSON json=new JSONArray(list);
		return json.toString();
	}
	
}
