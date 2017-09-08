package com.serviceimpl.ljl;

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
		
		IndetailDao.SvaeText(map);
		return 0;
	}

	@Override
	public int UpdateText(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
