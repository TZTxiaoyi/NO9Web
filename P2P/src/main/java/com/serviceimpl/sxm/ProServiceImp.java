package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProDao;
import com.service.sxm.ProService;
@Service
public class ProServiceImp implements ProService{
	@Autowired
	ProDao pDao;
	
	public List<Object>selectProject(){
		return pDao.selectProject();
		
	}
}
