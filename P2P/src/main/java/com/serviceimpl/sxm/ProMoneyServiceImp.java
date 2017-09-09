package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.sxm.ProMoneyDao;
import com.service.sxm.ProMoneyService;
@Service
public class ProMoneyServiceImp implements ProMoneyService {
	@Autowired
	ProMoneyDao pmDao;
	@Override
	public List<Object> selectProMoney(Integer pid) {
		// TODO Auto-generated method stub
		return pmDao.selectProMoney(pid);
	}

}
