package com.serviceimpl.ljl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ljl.PersonalProjectsDaoLjl;
import com.entity.ljl.PerProLjl;
import com.service.Tool.FileUploadService;
import com.service.ljl.PerProServiceLjl;
@Service
public class PerProServiceImplLjl implements PerProServiceLjl{
	@Autowired
	PersonalProjectsDaoLjl PerDao;
	@Override
	public int UpdataPerPro(PerProLjl perpro) {
		int flag=PerDao.UpdatePersonalProjects(perpro);
		return flag;
	}
	@Override
	public String AllPerPro(PerProLjl perpro) {
		List list=PerDao.AllPersonalProjects(perpro);
		JSON json=new JSONArray(list);
		System.out.println(list.size());
		if(list.size()==1){
			return json.toString();
			
		}
		return "数据异常";
	}
	public Map SaveIdentity(Map map,PerProLjl perpro){
		System.out.println("cardimage:"+perpro.getCardimage1());
		System.out.println("cardimage:"+perpro.getCardimage2());
		if(perpro.getCardimage1()!=null){
			String url=(String)map.get("url");
			System.out.println("url:"+url);
			perpro.setCardimage1(url);
		}
		if(perpro.getCardimage2()!=null){
			String url=(String)map.get("url");
			System.out.println("url:"+url);
			perpro.setCardimage2(url);
		}
		System.out.println("errew45");
		int flag=PerDao.UpdatePersonalProjects(perpro);
		if(flag==1){
			return map;
		}else{
			map.put("flag",1);
			return map;
		}
	}
	
	
}
