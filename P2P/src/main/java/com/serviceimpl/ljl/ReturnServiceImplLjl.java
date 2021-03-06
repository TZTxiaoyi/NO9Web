package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ljl.ProjectsDaoLjl;
import com.dao.ljl.ReturnProjectsDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;
import com.service.ljl.ReturnService;

import oracle.net.aso.h;

@Service
public class ReturnServiceImplLjl implements ReturnService{
	@Autowired
	ReturnProjectsDaoLjl ReturnDao;

	@Autowired
	ProjectsDaoLjl proDao;
	/**
	 * 更新保存项目回报项
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	public String SaveReturn(Map map){
		System.out.println("wsdasd");
		Map<String,String> indexarr=(Map<String,String>)map.get("indexarr");
		Map<String,Map> formdata=(Map<String,Map>)map.get("formdata");
		int initialindex=(int)map.get("initialindex");
		for (Map.Entry<String ,String> entry : indexarr.entrySet()) {
			String indexname=entry.getKey();
			int index=Integer.parseInt(entry.getValue());
			Map <String,String>returndata=formdata.get(indexname);
			Map returnmap=new HashMap();
			returnmap.put("projectsid",map.get("projectsid"));
			returnmap.put("return_type", Integer.parseInt(returndata.get("return_type")));
			returnmap.put("offer_money", Integer.parseInt(returndata.get("offer_money")));
			returnmap.put("return_title",returndata.get("return_title"));
			returnmap.put("return_content",returndata.get("return_content"));
			//returnmap.put("limit_people", Integer.parseInt(returndata.get("limit_people")));
			returnmap.put("return_time", Integer.parseInt(returndata.get("return_time")));
			returnmap.put("formindex", index);
			if(index>initialindex){
				System.out.println(returnmap);
				ReturnDao.SaveReturnProjects(returnmap);
			}else if(index<=initialindex){
				ReturnDao.UpdateReturnProjects(returnmap);
			}
			
		}
		return "success";
		
		
	}
	/**
	 * 删除项目的回报项
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String DeleteReturn(ReturnLjl returnljl) {
		// TODO Auto-generated method stub
		ReturnDao.DeleteReturnProjects(returnljl);
		return null;
	}
	/**
	 * 查询项目回报项
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public Map AllReturn(ReturnLjl returnljl) {
		List list=ReturnDao.AllReturnProjects(returnljl);
		Map map=new HashMap();
		if(list.size()==0){
			map.put("flag", 0);
			
		}else if(list.size()>0){
			map.put("flag", 1);
			map.put("formdata", list);
		};
		return map;
	}
	/**
	 * 提交审核项目
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String SExamine(ProjectsLjl projectsljl) {
		// TODO Auto-generated method stub
		//int flag=ReturnDao.SExamine(projectsljl);
		Map projects=new HashMap();
		projects.put("projectsid",projectsljl.getProjectsid());
		projects.put("projectsstate",15);
		
		int flag=proDao.UpdateProuu(projects);
		if(flag==1){
			return "success";
			
		}
		return "err";
	}
	
	
}
