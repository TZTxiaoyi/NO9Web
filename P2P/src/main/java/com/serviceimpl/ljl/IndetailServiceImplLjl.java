package com.serviceimpl.ljl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.IndetailProjectsDaoLjl;
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
	public List AllIndetail() {
		// TODO Auto-generated method stub
		return null;
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
			  if(title.get(indexKey)!=null&places>initialindex){
				  String mtitle=title.get(indexKey);
				  String mbody=body.get(indexKey);
				  Map indetailtext=new HashMap();
				  indetailtext.put("projectsid", projectsid);
				  indetailtext.put("title", mtitle);
				  indetailtext.put("body", mbody);
				  indetailtext.put("places", places);
				  IndetailDao.SvaeText(indetailtext);
			  }else if(title.get(indexKey)!=null&places<initialindex){
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
		return 0;
	}

	@Override
	public int UpdateText(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
