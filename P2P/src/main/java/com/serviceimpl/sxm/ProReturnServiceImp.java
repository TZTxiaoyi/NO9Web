package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProReturnDao;
import com.entity.ljl.ReturnLjl;
import com.service.sxm.ProReturnService;
@Service
public class ProReturnServiceImp implements ProReturnService {
	@Autowired
	ProReturnDao prd;
	@Override
	public List selectProReturn(ReturnLjl  r) {
		// TODO Auto-generated method stub
		return prd.selectProReturn(r);
	}

}
