package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.IndetailProjectsDaoLjl;
import com.entity.ljl.IndetailLjl;
import com.entity.ljl.IndetailPhotoLjl;
import com.entity.ljl.ProjectsLjl;
import com.service.ljl.IndetailServiceLjl;
@Service
public class IndetailServiceImplLjl implements IndetailServiceLjl{
	@Autowired
	IndetailProjectsDaoLjl IndetailDao;
	@Override
	public int SaveIndetail() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int UpdateIndetail() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List AllIndetail(ProjectsLjl projects) {
		List list=IndetailDao.AllIndetailProjects(projects);
		if (list.size()==0){
			
			
		}
		return list;
	}

	@Override
	public int SvaeText(Map map) {
		int projectsid=(int)map.get("projectsid");
		//String initial=(String)map.get("initialindex");
		//System.out.println(initial);
		int initialindex=(int)map.get("initialindex");
		Map<String ,Integer> index=(Map<String ,Integer>)map.get("index");
		Map<String ,String> title=(Map<String ,String>)map.get("title");
		Map<String ,String> body=(Map<String ,String>)map.get("body");
		System.out.println(index);
		System.out.println(title);
		System.out.println(body);
		 for (Map.Entry<String ,Integer> entry : index.entrySet()) {
			 // System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
			  String indexKey=(String)entry.getKey();
			  int places=entry.getValue();
			  if(title.get(indexKey)!=null&&places>initialindex){
				  String mtitle=title.get(indexKey);
				  String mbody=body.get(indexKey);
				  Map indetailtext=new HashMap();
				  indetailtext.put("projectsid", projectsid);
				  indetailtext.put("title", mtitle);
				  indetailtext.put("body", mbody);
				  indetailtext.put("places", places);
				  IndetailDao.SvaeText(indetailtext);
				  int textid=(int)indetailtext.get("textid");
				  Map indetail=new HashMap();
				  indetail.put("projectsid", projectsid);
				  indetail.put("places",places);
				  indetail.put("textid", textid);
				  indetail.put("photoid",0);
				  IndetailDao.SaveIndetailProjects(indetail);
			  }else if(title.get(indexKey)!=null&&places<initialindex){
				  String mtitle=title.get(indexKey);
				  String mbody=body.get(indexKey);
				  Map indetailtext=new HashMap();
				  indetailtext.put("projectsid", projectsid);
				  indetailtext.put("title", mtitle);
				  indetailtext.put("body", mbody);
				  indetailtext.put("places", places);
				  IndetailDao.UpdateText(indetailtext);
				  
			  }
			  
			  
		 }
		//IndetailDao.SvaeText(map);
		return 1;
	}
	@Override
	public Map SvaePhoto(Map map,IndetailPhotoLjl  IndetailPhoto) {
		System.out.println("fggf");
		int flag=0;
		if(map.get("url")!=null&&IndetailPhoto.getPlaces()>IndetailPhoto.getInitialindex()){
			IndetailPhoto.setUrl((String)map.get("url"));
			flag =IndetailDao.SvaePhoto(IndetailPhoto);
			int photoid=IndetailPhoto.getPhotoid();
			JSON json=new JSONArray();
			Map indetail=(Map)json.toJSON(IndetailPhoto);
			indetail.put("textid", 0);
			System.out.println("photoid:"+indetail);
			IndetailDao.SaveIndetailProjects(indetail);
		}else if(map.get("url")!=null&&IndetailPhoto.getPlaces()<=IndetailPhoto.getInitialindex()){
			IndetailPhoto.setUrl((String)map.get("url"));
			flag =IndetailDao.UpdatePhoto(IndetailPhoto);
		}
		if(flag==1){
			return map;
		}else{
			map.put("flag",1);
			return map;
		}
	}

	@Override
	public int DeleteIndetail(IndetailLjl indetail) {
		int flag=IndetailDao.DeleteIndetail(indetail);
		int flag1=0;
		int flag2=0;
		if(indetail.getChoice()=="text"){
			System.out.println("dsfsfa");
			flag1=IndetailDao.DeleteText(indetail);
			
		}else if(indetail.getChoice()=="photo"){
			System.out.println("photo");
			flag2=IndetailDao.DeletePhoto(indetail);
		}
		//IndetailDao.
		System.out.println(flag);
		System.out.println(flag1);
		System.out.println(flag2);
		if (flag==1&&flag1==1 ){
			
			return 1;
		}else if(flag==1&&flag2==1){
			return 1;
			
		}
		return 0;
	}

	@Override
	public int DeleteText(IndetailLjl indetail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int DeletePhoto(IndetailLjl indetail) {
		// TODO Auto-generated method stub
		return 0;
	}

}
