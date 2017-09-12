package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.ReturnProjectsDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;
import com.service.ljl.ReturnService;

@Service
public class ReturnServiceImplLjl implements ReturnService{
	@Autowired
	ReturnProjectsDaoLjl ReturnDao;
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
	@Override
	public String DeleteReturn(ReturnLjl returnljl) {
		// TODO Auto-generated method stub
		ReturnDao.DeleteReturnProjects(returnljl);
		return null;
	}
	@Override
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
	@Override
	public String SExamine(ProjectsLjl projectsljl) {
		// TODO Auto-generated method stub
		int flag=ReturnDao.SExamine(projectsljl);
		if(flag==1){
			return "success";
			
		}
		return "err";
	}
	
	
}
