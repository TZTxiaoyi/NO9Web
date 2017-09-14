package com.serviceimpl.ljl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.TwoLoanDaoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Orders;
import com.service.ljl.TwoLoanServiceLjl;
@Service
public class TwoLoanServiceImplLjl implements TwoLoanServiceLjl {
	@Autowired
	TwoLoanDaoLjl twoloan;

	@Override
	public List AllReturn() {
		// TODO Auto-generated method stub
		List list= twoloan.AllReturn();
		return list;
	}
	
	
}
