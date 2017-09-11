package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.CommDao;
import com.entity.sxm.Commentary;
import com.service.sxm.CommService;
@Service
public class CommServiceImp implements CommService {
	@Autowired
	CommDao cdao;
	
	public int saveComm(Commentary c) {
		// TODO Auto-generated method stub
		return cdao.saveComm(c);
	}

	@Override
	public List<Object> selectComm() {
		// TODO Auto-generated method stub
		return cdao.selectComm();
	}

}
