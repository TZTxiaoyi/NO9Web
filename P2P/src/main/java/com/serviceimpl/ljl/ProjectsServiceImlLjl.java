package com.serviceimpl.ljl;

import java.util.List;

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
		
		int flag=projectsdaoljl.SaveProjects(proLjl);
		if(flag==1){
			
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
