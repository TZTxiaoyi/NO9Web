package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.RepayDao;
import com.entity.ly.Project;
import com.service.ly.RepayService;
@Service
public class RepayServiceImpl implements RepayService{

	@Autowired
	RepayDao repayDao;
	/**
	 * 回报审核
	 */
	public List<Object> selReturn(Project projectsid){
		// TODO Auto-generated method stub
		return repayDao.selReturn(projectsid);
	}
	/**
	 * 回报审核记录
	 */
	@Override
	public List<Object> selReturnRec(Project projectsid) {
		// TODO Auto-generated method stub
		return repayDao.selReturnRecord(projectsid);
	}	
}
